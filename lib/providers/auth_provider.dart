import 'dart:convert';

import 'package:apex_sc/models/api_result.dart';
import 'package:apex_sc/models/user.dart';
import 'package:apex_sc/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  User? user;

  saveUser(User value) {
    user = value;
    notifyListeners();
  }

  void signIn({required String email, required String password}) async {
    OneContext.instance.showProgressIndicator();
    APIResult result =
        await AuthServices.signIn(email: email, password: password);
    print(result.response!.body);
    OneContext.instance.hideProgressIndicator();
    if (result.success) {
      saveUser(
          User.fromJson(jsonDecode(result.response!.body)['data']['user']));
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("user-token", jsonDecode(result.response!.body)['token']);
      OneContext.instance.pushNamedAndRemoveUntil(
        'Home',
        (Route<dynamic> route) => false,
      );
    } else {
      OneContext.instance.showSnackBar(builder: (context) {
        return SnackBar(content: Text(result.message));
      });
    }
  }
}
