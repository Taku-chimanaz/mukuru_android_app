import 'package:flutter/material.dart';
import 'package:mukuru_app/projects/BottomAppBar.dart';
import 'package:mukuru_app/projects/customWidgets/collect_voucher.dart';
import 'package:mukuru_app/projects/customWidgets/voucher.dart';
import 'package:mukuru_app/projects/providers/user_provider.dart';
import 'package:mukuru_app/states.dart';
import 'package:provider/provider.dart';

class UncollectedVouchers extends StatefulWidget {
  const UncollectedVouchers({super.key});

  @override
  State<UncollectedVouchers> createState() => _UncollectedVouchersState();
}

class _UncollectedVouchersState extends State<UncollectedVouchers> {
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
            voucher['recipient'] == userProvider.user.id &&
            voucher['isCashedIn'] == false &&
            voucher['isCancelled'] == false &&
            voucher['isCollected'] == false)
        .toList();
    vouchers = activeSentVouchers
        .map((voucher) => Voucher(
              VoucherStatusWidget: CollectVoucher(voucherID: voucher['_id']),
              isUncollectedVoucher: true,
              voucher: voucher,
            ))
        .toList()
        .reversed
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(20.0, 18.0, 0, 10.0),
            child: Text(
              'Uncollected Vouchers',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
            ),
          ),
          vouchers.length > 0
              ? Expanded(
                  child: ListView.builder(
                      itemCount: vouchers.length,
                      itemBuilder: (BuildContext context, int index) {
                        return vouchers[index];
                      }),
                )
              : Expanded(
                  child: Center(
                  child: Text('No active vouchers to be collected'),
                ))
        ],
      )),
      bottomNavigationBar: BottomBar(activePage: 'Vouchers'),
    );
  }
}
