import 'package:flutter/material.dart';
import 'package:mukuru_app/projects/colors.dart';

class Voucher extends StatelessWidget {
  final Widget VoucherStatusWidget;

  const Voucher({super.key, required this.VoucherStatusWidget});

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
                  Icons.shopping_bag,
                  color: MyAppColors.themeColor,
                ),
                Text(
                  '19/07/23',
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
                        '\$30',
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        'Jane Doe',
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
