import 'package:flutter/material.dart';
import 'package:mukuru_app/projects/colors.dart';

class Voucher extends StatelessWidget {
  final Widget VoucherStatusWidget;
  final Map<String, dynamic> voucher;
  const Voucher(
      {super.key, required this.VoucherStatusWidget, required this.voucher});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: MyAppColors.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  voucher['voucherType'] == 'cash'
                      ? Icons.monetization_on
                      : Icons.shopping_bag,
                  color: MyAppColors.lighterThemeColor,
                ),
                Text(
                  '${voucher['createdAt']}'.split('T')[0],
                  style: TextStyle(fontWeight: FontWeight.w600),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 15.0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\$${voucher['amount']}',
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        '${voucher['recipientObject']['firstname']} ${voucher['recipientObject']['surname']}',
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  VoucherStatusWidget
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
