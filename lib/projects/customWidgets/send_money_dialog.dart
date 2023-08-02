import 'package:flutter/material.dart';
import 'package:mukuru_app/projects/customWidgets/SendMoneyForm.dart';

class SendMoneyDialog extends StatefulWidget {
  const SendMoneyDialog({super.key});

  @override
  State<SendMoneyDialog> createState() => _SendMoneyDialogState();
}

class _SendMoneyDialogState extends State<SendMoneyDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      padding: EdgeInsets.fromLTRB(16.0, 25.0, 16.0, 16.0),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 22.0),
            child: Text(
              'Send Money',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
            ),
          ),
          SendMoneyForm(),
        ],
      ),
    );
  }
}

// Form

