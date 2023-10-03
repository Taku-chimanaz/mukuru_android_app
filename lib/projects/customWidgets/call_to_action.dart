import 'package:flutter/material.dart';
import 'package:mukuru_app/projects/colors.dart';
import 'package:mukuru_app/projects/customWidgets/send_money_dialog.dart';

class CallToAction extends StatefulWidget {
  const CallToAction({super.key});

  @override
  State<CallToAction> createState() => _CallToActionState();
}

class _CallToActionState extends State<CallToAction> {
  double heightFactor = 0.45;

  void updateHeightFactor() {
    setState(() {
      heightFactor = heightFactor == 0.45 ? 0.75 : 0.45;
    });
  }

  //
  void _openSendMoneyBottomSheet(BuildContext ctx) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        context: ctx,
        builder: (_) {
          return FractionallySizedBox(
            heightFactor: heightFactor,
            child: SendMoneyDialog(updateHeightFactor: updateHeightFactor),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.zero,
              topRight: Radius.zero,
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15))),
      color: MyAppColors.primaryColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18.0, 22.0, 18.0, 30.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'What do you want to do today?',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                      color: Colors.white),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
              child: Wrap(
                spacing: 55.0,
                alignment: WrapAlignment.spaceBetween,
                runSpacing: 15.0,
                children: [
                  CallToActionButton(
                    buttonText: 'Send Money',
                    buttonIcon: Icon(Icons.send_to_mobile),
                    parentWidgetContext: context,
                    openBottomSheetFunction: _openSendMoneyBottomSheet,
                  ),
                  CallToActionButton(
                    buttonText: 'Add Recipient',
                    buttonIcon: Icon(Icons.person_4),
                    parentWidgetContext: context,
                    openBottomSheetFunction: _openSendMoneyBottomSheet,
                  ),
                  CallToActionButton(
                    buttonText: 'Make Payment',
                    buttonIcon: Icon(Icons.payment),
                    parentWidgetContext: context,
                    openBottomSheetFunction: _openSendMoneyBottomSheet,
                  ),
                  CallToActionButton(
                    buttonText: 'Send Groceries',
                    buttonIcon: Icon(Icons.shopping_bag),
                    parentWidgetContext: context,
                    openBottomSheetFunction: _openSendMoneyBottomSheet,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CallToActionButton extends StatelessWidget {
  final String buttonText;
  final Icon buttonIcon;
  final BuildContext parentWidgetContext;
  final Function openBottomSheetFunction;

  const CallToActionButton({
    super.key,
    required this.buttonText,
    required this.buttonIcon,
    required this.parentWidgetContext,
    required this.openBottomSheetFunction,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => openBottomSheetFunction(parentWidgetContext),
        child: Column(children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 5.0),
            child: buttonIcon,
          ),
          Text(
            buttonText,
            style: TextStyle(fontSize: 10.0),
          )
        ]),
        style: ElevatedButton.styleFrom(
            backgroundColor: MyAppColors.themeColor,
            shape: CircleBorder(),
            minimumSize: Size(100.0, 100.0)));
  }
}
