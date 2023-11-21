import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:mukuru_app/app_constants.dart';
import 'package:mukuru_app/projects/classes/user.dart';
import 'package:quickalert/quickalert.dart';

class UserProvider extends ChangeNotifier {
  User user = User.placeholderUser();

  loginUser(String email, String password, BuildContext context,
      Function setLoading) async {
    final payload = jsonEncode({"email": email, "password": password});

    setLoading(true);

    try {
      final responseJson = await http.post(
          Uri.parse(MyAppConstants.apiUrl + '/api/users/login-user'),
          headers: MyAppConstants.headers,
          body: payload);
      final decodedJson = jsonDecode(responseJson.body) as Map<String, dynamic>;

      if (responseJson.statusCode == 200) {
        user = User.fromJson(decodedJson['user']);
        notifyListeners();
        context.go('/load-data');
      } else {
        setLoading(false);
        QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            text: decodedJson['message']);
      }
    } catch (e) {
      setLoading(false);
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: 'An unexpected error ocurred,please try again');
    }
  }

  updateUser(String id, String email, String phoneNumber, String firstname,
      String surname, BuildContext context, Function setLoading) async {
    setLoading(true);
    final updateUserResult = await user.updateUser(
        id, email, phoneNumber, firstname, surname, setLoading);

    if (updateUserResult == 'user updated') {
      setLoading(false);
      QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: 'User updated successfully',
          showCancelBtn: false);
      notifyListeners();
    } else {
      setLoading(false);
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: updateUserResult,
          showCancelBtn: false);
    }
  }

  updateUserBalance(double newBalance) {
    user.balance = newBalance;
    notifyListeners();
  }
}
