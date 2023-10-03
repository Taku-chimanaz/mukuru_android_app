import 'package:flutter/material.dart';
import 'package:mukuru_app/projects/BottomAppBar.dart';
import 'package:mukuru_app/projects/colors.dart';
import 'package:mukuru_app/projects/customWidgets/call_to_action.dart';
import 'package:mukuru_app/projects/customWidgets/sent_voucher.dart';
import 'package:mukuru_app/projects/customWidgets/user_details.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppColors.whiteSmokeColor,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserDetails(),
          CallToAction(),
          Container(
            margin: EdgeInsets.fromLTRB(17.0, 15.0, 0, 0),
            child: Text(
              'Sent Vouchers',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(child: SentVouchers())
        ],
      )),
      bottomNavigationBar: BottomBar(
        activePage: 'Home',
      ),
    );
  }
}
