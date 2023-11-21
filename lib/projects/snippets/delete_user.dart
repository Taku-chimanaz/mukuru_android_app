import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mukuru_app/app_constants.dart';
import 'package:quickalert/quickalert.dart';
import 'package:go_router/go_router.dart';

deleteUser(String id, Function setLoading, BuildContext context) async {
  try {
    setLoading(true);
    final responseJson = await http.delete(
        Uri.parse(MyAppConstants.apiUrl + '/api/users/delete-user/$id'),
        headers: MyAppConstants.headers);
    final decodedJson = jsonDecode(responseJson.body) as Map<String, dynamic>;

    if (responseJson.statusCode == 200) {
      setLoading(false);
      QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: 'User deleted successfully',
          showCancelBtn: false);
      //user = null;
      Future.delayed(
          Duration(seconds: 2), () => GoRouter.of(context).go('/login'));
    } else {
      setLoading(false);
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: decodedJson['message'],
          showCancelBtn: false);
    }
  } catch (e) {
    QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        text: 'An unexpected error ocurred,please try again');
  }
}
