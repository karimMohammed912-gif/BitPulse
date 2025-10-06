import 'package:bitpulse/core/Error/error.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
// Using Firebase's OAuth provider flow; no direct google_sign_in dependency needed here
class FirebaseAuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  // Get current user
  static User? get currentUser => _auth.currentUser;

  // Get current user stream
  static Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Check if user is signed in
  static bool get isSignedIn => _auth.currentUser != null;

  // Get user email
  static String? get userEmail => _auth.currentUser?.email;

  // Get user ID
  static String? get userId => _auth.currentUser?.uid;

  /// Sign up with email and password
  static Future<Either<Failure, User>> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      return Right(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      return Left(_handleFirebaseAuthException(e));
    } catch (e) {
      return Left(ServerFailure('Sign up failed: $e'));
    }
  }

  /// Sign in with email and password
  static Future<Either<Failure, User>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      return Right(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      return Left(_handleFirebaseAuthException(e));
    } catch (e) {
      return Left(ServerFailure('Sign in failed: $e'));
    }
  }

  /// Sign out
  static Future<Either<Failure, void>> signOut() async {
    try {
      await _auth.signOut();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Sign out failed: $e'));
    }
  }

  /// Sign in with Google (web and mobile)
  static Future<Either<Failure, User>> signInWithGoogle() async {
    try {
      if (kIsWeb) {
        print('🔴 Google sign-in failed: web');
        final GoogleAuthProvider googleProvider = GoogleAuthProvider();
        final UserCredential userCredential = await _auth.signInWithPopup(googleProvider);
        return Right(userCredential.user!);
      } else {
        print('🔴 Google sign-in failed: mobile');
        final GoogleAuthProvider googleProvider = GoogleAuthProvider();
        final UserCredential userCredential = await _auth.signInWithProvider(googleProvider);
        return Right(userCredential.user!);
      }
    } on FirebaseAuthException catch (e) {
      print('🔴 Google sign-in failed: ${e.message}');
      return Left(_handleFirebaseAuthException(e));
    } catch (e) {
      print('🔴 Google sign-in failed: $e');
      return Left(ServerFailure('Google sign-in failed: $e'));
    }
  }

  /// Handle Firebase Auth exceptions
  static Failure _handleFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return ServerFailure('The password is too weak');
      case 'email-already-in-use':
        return ServerFailure('An account already exists for this email');
      case 'user-not-found':
        return ServerFailure('No user found for this email');
      case 'wrong-password':
        return ServerFailure('Wrong password provided');
      case 'invalid-email':
        return ServerFailure('The email address is not valid');
      case 'user-disabled':
        return ServerFailure('This user account has been disabled');
      case 'too-many-requests':
        return ServerFailure('Too many requests. Try again later');
      case 'network-request-failed':
        return ServerFailure('Network error. Check your connection');
      default:
        return ServerFailure('Authentication error: ${e.message}');
    }
  }
}