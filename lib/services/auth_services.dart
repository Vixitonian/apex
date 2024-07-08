import 'dart:async';
import 'dart:convert';

import 'package:apex_sc/models/api_result.dart';
import 'package:apex_sc/utils/api_endpoints.dart';
import 'package:apex_sc/utils/api_headers.dart';
import 'package:apex_sc/utils/helpers.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  static Future<APIResult> signIn(
      {required String email, required String password}) async {
    var deviceName = await getDeviceName();

    try {
      var response = await http.post(
        Uri.parse(ApiEndpoints.loginEndPoint),
        headers: APIHeaders.defaultHeader,
        body: {'email': email, 'password': password, 'device_name': deviceName},
      );

      if (response.statusCode == 200) {
        print(response.statusCode);
        // Successful sign-in
        return APIResult(
            success: true, message: 'Signed In Successful', response: response);
      } else {
        print(response.statusCode);
        return APIResult(
            success: false, message: 'Signed In Failed', response: response);
      }
    } catch (e) {
      print('Error Occurred');
      print(e);
      return APIResult(
        success: false,
        message: 'An Error Occurred',
      );
    }
  }
}
