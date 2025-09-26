

import 'package:dio/dio.dart';

class Api {
  Dio dio;
  Api(this.dio);


  // Add more endpoints as needed

  Future<dynamic> get(
 {   String? parameters, 
   required String baseUrl,
   required String endpoint,
    Map<String, dynamic>? headers}

  ) async {
    // Example of a GET request using Dio
    final url = '$baseUrl$endpoint?$parameters';
    // final options = Options(headers: headers)
      var reponse = await dio.get(url);
      return reponse;
  
      // Handle error
     

    // Implement GET request logic here
  }
}
