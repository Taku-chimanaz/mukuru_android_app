import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:mukuru_app/app_constants.dart';
import 'package:quickalert/quickalert.dart';

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

  // revoke voucher

  void revokeVoucher(
      {required String voucherID,
      required BuildContext context,
      required userID,
      required Function updateUserInfo}) async {
    try {
      final revokeVoucherReq = await http.put(
          Uri.parse(MyAppConstants.apiUrl +
              '/api/vouchers/revoke-voucher/$voucherID'),
          headers: MyAppConstants.headers,
          body: jsonEncode({'userID': userID}));
      final responseJson =
          jsonDecode(revokeVoucherReq.body) as Map<String, dynamic>;

      if (revokeVoucherReq.statusCode == 200) {
        if (responseJson['user'] != null) {
          updateUserInfo(userUpdatedInfo: responseJson['user']);
        }
        updateVouchers(newVouchers: responseJson['vouchers']);
        QuickAlert.show(
            context: context,
            type: QuickAlertType.success,
            text: 'Voucher revoked');
      } else {
        QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            text: 'Internal server error occured,try again');
      }
    } catch (e) {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: 'An unexpected error occured,try again');
    }
  }

  void updateVouchers({required List newVouchers}) {
    vouchers!['vouchers'] = newVouchers;
    notifyListeners();
  }

  void addVoucherToList({required Map<String, dynamic> voucher}) {
    vouchers!['vouchers'].add(voucher);
    notifyListeners();
  }
}
