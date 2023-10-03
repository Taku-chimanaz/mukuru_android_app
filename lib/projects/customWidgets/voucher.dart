import 'package:flutter/material.dart';
import 'package:mukuru_app/projects/colors.dart';
import 'package:mukuru_app/projects/customWidgets/cash_in.dart';

class Voucher extends StatelessWidget {
  final Widget VoucherStatusWidget;
  final bool isUncollectedVoucher;
  final Map<String, dynamic> voucher;
  const Voucher(
      {super.key,
      required this.VoucherStatusWidget,
      required this.voucher,
      required this.isUncollectedVoucher});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: MyAppColors.backgroundColor,
          border: Border.all(color: MyAppColors.borderColor, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 15.0, 12.0, 15.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  border: BorderDirectional(
                      bottom: BorderSide(
                          width: 1, color: MyAppColors.borderColor))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    voucher['voucherType'] == 'cash'
                        ? Icons.monetization_on
                        : Icons.shopping_bag,
                    color: MyAppColors.primaryColor,
                  ),
                  Text(
                    '${voucher['voucherType'] == 'cash' ? 'Cash Voucher' : 'Groceries Voucher'}',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 15.0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Icon(Icons.person),
                        Text(
                          '${voucher['recipientObject']['firstname']} ${voucher['recipientObject']['surname']}',
                          style: TextStyle(
                              fontSize: 12.0, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Icon(Icons.money),
                        Text(
                          '\$${voucher['amount']}',
                          style: TextStyle(
                              fontSize: 12.0, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Icon(Icons.calendar_month),
                        Text(
                          '${voucher['createdAt']}'.split('T')[0],
                          style: TextStyle(
                              fontSize: 12.0, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Row(
                  children: [
                    VoucherStatusWidget,
                    if (isUncollectedVoucher)
                      SizedBox(
                        width: 15,
                      ),
                    if (isUncollectedVoucher)
                      CashInVoucher(voucherID: voucher['_id'])
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
