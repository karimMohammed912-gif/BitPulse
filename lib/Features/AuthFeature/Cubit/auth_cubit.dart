import 'package:bitpulse/Features/AuthFeature/Cubit/auth_state.dart';
import 'package:bitpulse/Features/AuthFeature/Service/fireBase_service.dart';
import 'package:bloc/bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthInitial()) {
    _init();
  }
void _init() {
  FirebaseAuthService.authStateChanges.listen((user) {
    if (user != null) {
      print('👤 User signed in: ${user.email}');
      emit(AuthAuthenticated(userId: user.uid, email: user.email ?? ''));
    } else {
      print('👤 User signed out');
      emit(const AuthUnauthenticated());
    }
  });
}

  Future<void> signUp({required String email, required String password}) async {
    emit(const AuthLoading()); // Remove the boolean parameter

    final result = await FirebaseAuthService.signUp(
      email: email,
      password: password,
    );

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => {
        // State will be updated via auth state listener
      },
    );
  }

  Future<void> signIn({required String email, required String password}) async {
    emit(const AuthLoading()); // Remove the boolean parameter

    final result = await FirebaseAuthService.signIn(
      email: email,
      password: password,
    );

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => {
        // State will be updated via auth state listener
      },
    );
  }

 Future<void> signOut() async {
  print('🔄 Starting logout...');
  emit(const AuthLoading());

  final result = await FirebaseAuthService.signOut();

  result.fold(
    (failure) {
      print('❌ Logout failed: ${failure.message}');
      emit(AuthError(failure.message));
    },
    (_) {
      print('✅ Logout successful');
      // State will be updated via auth state listener
    },
  );
}

  void clearError() {
    if (state is AuthError) {
      if (FirebaseAuthService.isSignedIn) {
        final user = FirebaseAuthService.currentUser!;
        emit(AuthAuthenticated(userId: user.uid, email: user.email ?? ''));
      } else {
        emit(const AuthUnauthenticated());
      }
    }
  }
}
