import 'package:flutter/material.dart';
import 'package:mukuru_app/projects/customWidgets/revoke_voucher.dart';
import 'package:mukuru_app/projects/customWidgets/voucher.dart';
import 'package:mukuru_app/projects/providers/user_provider.dart';
import 'package:mukuru_app/states.dart';
import 'package:provider/provider.dart';

class SentVouchers extends StatefulWidget {
  SentVouchers({super.key});

  @override
  State<SentVouchers> createState() => _SentVouchersState();
}

class _SentVouchersState extends State<SentVouchers> {
  late final UserProvider userProvider =
      Provider.of<UserProvider>(context, listen: false);
  late final VouchersProvider vouchersProvider =
      Provider.of<VouchersProvider>(context, listen: true);
  late List activeSentVouchers;
  late List vouchers;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    activeSentVouchers = vouchersProvider.vouchers!['vouchers']
        .where((voucher) =>
            voucher['sender'] == userProvider.user.id &&
            voucher['isCashedIn'] == false &&
            voucher['isCancelled'] == false &&
            voucher['isCollected'] == false)
        .toList();
    vouchers = activeSentVouchers
        .map((voucher) => Voucher(
              VoucherStatusWidget: RevokeVoucher(voucherID: voucher['_id']),
              isUncollectedVoucher: false,
              voucher: voucher,
            ))
        .toList()
        .reversed
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    if (vouchers.length > 0) {
      return ListView.builder(
          itemCount: vouchers.length,
          itemBuilder: (BuildContext context, int index) {
            return vouchers[index];
          });
    } else {
      return Center(
        child: Text('0 active sent vouchers available'),
      );
    }
  }
}
