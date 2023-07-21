import 'package:flutter/material.dart';
import 'package:mukuru_app/projects/customWidgets/revoke_voucher.dart';
import 'package:mukuru_app/projects/customWidgets/voucher.dart';

class SentVouchers extends StatelessWidget {
  const SentVouchers({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.fromLTRB(18.0, 22.0, 18.0, 22.0),
        children: [
          Voucher(VoucherStatusWidget: RevokeVoucher()),
          Voucher(
            VoucherStatusWidget: RevokeVoucher(),
          ),
          Voucher(
            VoucherStatusWidget: RevokeVoucher(),
          ),
          Voucher(
            VoucherStatusWidget: RevokeVoucher(),
          ),
          Voucher(
            VoucherStatusWidget: RevokeVoucher(),
          ),
          Voucher(
            VoucherStatusWidget: RevokeVoucher(),
          ),
          Voucher(
            VoucherStatusWidget: RevokeVoucher(),
          ),
          Voucher(
            VoucherStatusWidget: RevokeVoucher(),
          ),
        ]);
  }
}
