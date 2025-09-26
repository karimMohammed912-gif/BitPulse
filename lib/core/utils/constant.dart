

import 'package:flutter_dotenv/flutter_dotenv.dart';

final String? apiKey = dotenv.env['Api_Key'];
final String? firebaseApiKey = dotenv.env['Firebase_Api_Key'];
final String? firebaseProjectId = dotenv.env['Firebase_Project_Id'];
final String? androidApiKey = dotenv.env['Android_Api_Key'];
final String? androidAppId = dotenv.env['Android_App_Id'];