import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:mukuru_app/projects/customWidgets/SendMoneyForm.dart';
import 'dart:async';

class SendMoneyDialog extends StatefulWidget {
  final Function updateHeightFactor;
  const SendMoneyDialog({super.key, required this.updateHeightFactor});

  @override
  State<SendMoneyDialog> createState() => _SendMoneyDialogState();
}

class _SendMoneyDialogState extends State<SendMoneyDialog> {
  late StreamSubscription<bool> keyboardSubscription;

  @override
  void initState() {
    super.initState();

    keyboardSubscription =
        KeyboardVisibilityController().onChange.listen((isVisible) {
      widget.updateHeightFactor();
    });
  }

  @override
  void dispose() {
    keyboardSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      padding: EdgeInsets.fromLTRB(16.0, 25.0, 16.0, 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
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

