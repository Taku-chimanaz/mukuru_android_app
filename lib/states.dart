import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:mukuru_app/app_constants.dart';

class VouchersProvider extends ChangeNotifier {
  Map<String, dynamic>? vouchers = null;
  bool error = false;

  void setVouchers(BuildContext context, String userID) async {
    http.Response fetchedVouchers = await http.get(Uri.parse(
        MyAppConstants.apiUrl + '/api/vouchers/fetch-vouchers/$userID'));

    if (fetchedVouchers.statusCode == 200) {
      final json = jsonDecode(fetchedVouchers.body) as Map<String, dynamic>;
      vouchers = json;
      notifyListeners();
      context.go('/home');
    } else {
      error = true;
    }
  }
}
