import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mukuru_app/app_constants.dart';
import 'package:mukuru_app/projects/colors.dart';
import 'package:quickalert/quickalert.dart';

class SendMoneyFormSnippets {
  // form validators

  static validateFormRecipient(String? value, String senderEmail) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }

    if (value.toLowerCase() == senderEmail.toLowerCase()) {
      return 'You cannot send money to yourself';
    }

    return null;
  }

  static validateFormAmount(String? value, String typeOfInput) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }

    if (value == '0' ||
        value == '0.0' ||
        value == '0.00' ||
        value == '0,0' ||
        value == '0,00') {
      return 'Amount cannot be zero';
    }

    if (value.contains('-')) {
      return 'You cannot send a negative amount';
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

  // functions

  static sendMoney(
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
      "voucherType": 'cash'
    };
    final jsonDetails = jsonEncode(details);
    final bool sufficientFunds = haveSufficientFunds(
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

          QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              text: json['message'],
              confirmBtnColor: MyAppColors.themeColor);
        }
      } catch (e) {
        print(e);
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

  // check for sufficient funds to do a transaction

  static bool haveSufficientFunds(
      {required double balance,
      required String transactionAmount,
      required BuildContext context}) {
    double transactionDouble = transactionAmount.contains(',')
        ? double.parse(transactionAmount.replaceFirst(',', '.'))
        : double.parse(transactionAmount);

    if (balance < transactionDouble) {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.warning,
          text: 'You have insufficient funds to complete the transaction');
      return false;
    }

    return true;
  }
}
