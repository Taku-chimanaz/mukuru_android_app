import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class VouchersProvider extends ChangeNotifier {
  Map<String, dynamic>? vouchers = null;
  bool error = false;

  void setVouchers(BuildContext context) async {
    http.Response fetchedVouchers = await http
        .get(Uri.parse('http://localhost:5000/api/vouchers/fetch-vouchers'));

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
