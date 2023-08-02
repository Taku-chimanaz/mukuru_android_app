import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mukuru_app/app_constants.dart';
import 'package:mukuru_app/projects/colors.dart';
import 'package:quickalert/quickalert.dart';

class SendMoneyFormSnippets {
  static validateFormRecipient(String? value, String typeOfInput) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }

    return null;
  }

  static validateFormAmount(String? value, String typeOfInput) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }

    if (value == '0' || value == '0.0' || value == '0.00') {
      return 'Amount cannot be zero';
    }

    return null;
  }

  static checkIfFullName(String searchTerm, Function updateIsNotFullname) {
    final splittedString = searchTerm.split(' ');

    if (searchTerm.isEmpty || splittedString.length != 2) {
      updateIsNotFullname();
      return;
    } else {
      print('Damn');
    }
  }

  static sendMoney(
      {required String recipientEmail,
      required String amount,
      required BuildContext context}) async {
    final Map<String, String> details = {
      "recipient": recipientEmail,
      "amount": amount,
      "sender": '3899486645asdf3445',
      "voucherType": 'cash'
    };
    final jsonDetails = jsonEncode(details);
    final responseJson = await http.post(
        Uri.parse(MyAppConstants.apiUrl + '/api/vouchers/create-voucher'),
        headers: MyAppConstants.headers,
        body: jsonDetails);

    if (responseJson.statusCode == 200) {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: 'Transaction Completed Successfully!',
          confirmBtnColor: MyAppColors.themeColor);
    } else {
      final json = jsonDecode(responseJson.body) as Map<String, dynamic>;
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: json['message'],
          confirmBtnColor: MyAppColors.themeColor);
    }
  }
}
