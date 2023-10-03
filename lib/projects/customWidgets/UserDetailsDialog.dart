import 'package:flutter/material.dart';
import 'package:mukuru_app/projects/colors.dart';
import 'package:mukuru_app/projects/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class UserDetailsDialog extends StatefulWidget {
  final String userEmail;
  final double balance;
  const UserDetailsDialog(
      {super.key, required this.userEmail, required this.balance});

  @override
  State<UserDetailsDialog> createState() => _UserDetailsDialogState();
}

class _UserDetailsDialogState extends State<UserDetailsDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 350,
        padding: EdgeInsets.only(top: 45),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Account Balance: \$${widget.balance}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            QrImageView(
              data: widget.userEmail,
              eyeStyle: QrEyeStyle(
                  color: MyAppColors.primaryColor, eyeShape: QrEyeShape.square),
              size: 200,
            )
          ],
        ));
  }
}
