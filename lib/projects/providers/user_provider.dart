import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:mukuru_app/app_constants.dart';
import 'package:quickalert/quickalert.dart';

class UserProvider extends ChangeNotifier {
  Map<String, dynamic>? user = null;

  loginUser(String email, String password, BuildContext context) async {
    final payload = jsonEncode({"email": email, "password": password});

    final responseJson = await http.post(
        Uri.parse(MyAppConstants.apiUrl + '/api/users/login-user'),
        headers: MyAppConstants.headers,
        body: payload);
    final decodedJson = jsonDecode(responseJson.body) as Map<String, dynamic>;

    if (responseJson.statusCode == 200) {
      user = decodedJson;
      notifyListeners();
      context.go('/load-data');
    } else {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: decodedJson['message']);
    }
  }

  createUser(String email, String password, String firstname, String surname,
      BuildContext context) async {
    final payload = jsonEncode({
      "email": email,
      "password": password,
      "firstname": firstname,
      "surname": surname
    });

    final responseJson = await http.post(
        Uri.parse(MyAppConstants.apiUrl + '/api/users/create-user'),
        headers: MyAppConstants.headers,
        body: payload);
    final decodedJson = jsonDecode(responseJson.body) as Map<String, dynamic>;

    if (responseJson.statusCode == 200) {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: 'User created successfully',
          showCancelBtn: false);
      Future.delayed(Duration(seconds: 2), () => context.go('/login'));
    } else {
      print(decodedJson);
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: decodedJson['message'],
          showCancelBtn: false);
    }
  }
}
