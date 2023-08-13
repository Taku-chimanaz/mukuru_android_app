import 'package:flutter/material.dart';
import 'package:mukuru_app/projects/customWidgets/revoke_voucher.dart';
import 'package:mukuru_app/projects/customWidgets/voucher.dart';
import 'package:mukuru_app/states.dart';
import 'package:provider/provider.dart';

class SentVouchers extends StatefulWidget {
  SentVouchers({super.key});

  @override
  State<SentVouchers> createState() => _SentVouchersState();
}

class _SentVouchersState extends State<SentVouchers> {
  late final VouchersProvider vouchersProvider =
      Provider.of<VouchersProvider>(context, listen: true);
  late final vouchers = vouchersProvider.vouchers!['vouchers']
      .map((voucher) => Voucher(
            VoucherStatusWidget: RevokeVoucher(voucherID: voucher['_id']),
            voucher: voucher,
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    print(vouchers.runtimeType);
    return ListView.builder(
        itemCount: vouchers.length,
        itemBuilder: (BuildContext context, int index) {
          return vouchers[index];
        });
  }
}
