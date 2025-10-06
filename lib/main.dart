import 'package:bitpulse/bit_pulse.dart';
import 'package:bitpulse/core/di/dependency_injection.dart';
import 'package:bitpulse/core/utils/star_service.dart';
import 'package:bitpulse/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize dependency injection
  setup();
  // Load environment variables
  await dotenv.load(fileName: ".env");
  // Initialize Hive and StarService
  await Hive.initFlutter();
  await StarService.init();
  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const BitPulse());
}
