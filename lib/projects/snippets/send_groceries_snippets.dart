import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mukuru_app/app_constants.dart';
import 'package:mukuru_app/projects/colors.dart';
import 'package:mukuru_app/projects/snippets/SendMoneyFormSnippets.dart';
import 'package:quickalert/quickalert.dart';

class SendGroceriesSnippets {
  static sendGroceries(
      {required Map<String, dynamic> user,
      required Function resetTheFormFields,
      required Function addVoucherToList,
      required Function updateUserInfo,
      required Function setLoading,
      required String recipientEmail,
      required String amount,
      required BuildContext context}) async {
    final Map<String, String> details = {
      "recipient": recipientEmail,
      "amount": amount,
      "sender": user['_id'],
      "voucherType": 'grocery'
    };
    final jsonDetails = jsonEncode(details);
    final bool sufficientFunds = SendMoneyFormSnippets.haveSufficientFunds(
        balance: user['balance'], transactionAmount: amount, context: context);

    if (sufficientFunds) {
      setLoading(true);

      try {
        final responseJson = await http.post(
            Uri.parse(MyAppConstants.apiUrl + '/api/vouchers/create-voucher'),
            headers: MyAppConstants.headers,
            body: jsonDetails);
        final json = jsonDecode(responseJson.body) as Map<String, dynamic>;

        if (responseJson.statusCode == 200) {
          setLoading(false);
          resetTheFormFields();
          QuickAlert.show(
              context: context,
              type: QuickAlertType.success,
              text: 'Transaction Completed Successfully!',
              confirmBtnColor: MyAppColors.themeColor);
          updateUserInfo(userUpdatedInfo: json['user']);
          print(json['voucher']);
          addVoucherToList(voucher: json['voucher']);
        } else {
          setLoading(false);
          print(json);
          QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              text: json['message'],
              confirmBtnColor: MyAppColors.themeColor);
        }
      } catch (e) {
        setLoading(false);
        QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            text: 'An unexpected Error occured,try again.');
      }
    } else {
      return;
    }
  }
}
