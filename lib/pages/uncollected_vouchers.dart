import 'package:flutter/material.dart';
import 'package:mukuru_app/projects/BottomAppBar.dart';
import 'package:mukuru_app/projects/customWidgets/collect_voucher.dart';
import 'package:mukuru_app/projects/customWidgets/voucher.dart';

class UncollectedVouchers extends StatelessWidget {
  const UncollectedVouchers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20.0, 18.0, 0, 10.0),
            child: Text(
              'Uncollected Vouchers',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
            ),
          ),
          /* Expanded(
              child: ListView.builder(
            itemCount: 200,
            itemBuilder: (BuildContext context, index) {
              return Voucher(
                VoucherStatusWidget: CollectVoucher(),
                voucher: {},
              );
            },
          )) */
        ],
      )),
      bottomNavigationBar: BottomBar(activePage: 'uncollected'),
    );
  }
}
