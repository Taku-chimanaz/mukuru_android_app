import 'package:flutter/material.dart';
import 'package:mukuru_app/projects/colors.dart';
import 'package:mukuru_app/states.dart';
import 'package:provider/provider.dart';

class UserStatistics extends StatefulWidget {
  const UserStatistics({super.key});

  @override
  State<UserStatistics> createState() => _UserStatisticsState();
}

class _UserStatisticsState extends State<UserStatistics> {
  late final VouchersProvider vouchersProvider =
      Provider.of<VouchersProvider>(context);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 25, bottom: 25),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.zero,
              topRight: Radius.zero,
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      color: MyAppColors.primaryColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                'User Statistics',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Container(
                color: MyAppColors.primaryColor1,
                padding: EdgeInsets.fromLTRB(12, 18, 12, 12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Active Vouchers :',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text('${vouchersProvider.vouchers!['vouchers'].length}',
                            style: TextStyle(color: Colors.white))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sent Vouchers :',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                            '${vouchersProvider.vouchers!['sentVouchers'].length}',
                            style: TextStyle(color: Colors.white))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Received Vouchers :',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                            '${vouchersProvider.vouchers!['receivedVouchers'].length}',
                            style: TextStyle(color: Colors.white))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Cancelled On Me Vs :',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                            '${vouchersProvider.vouchers!['cancelledOnMe'].length}',
                            style: TextStyle(color: Colors.white))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Cancelled By Me Vs :',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                            '${vouchersProvider.vouchers!['cancelledByMe'].length}',
                            style: TextStyle(color: Colors.white))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
