import 'package:flutter/material.dart';
import 'package:mukuru_app/projects/colors.dart';

class CallToAction extends StatelessWidget {
  const CallToAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      color: MyAppColors.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18.0, 22.0, 18.0, 22.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'What do you want to do today?',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
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
                  ),
                  CallToActionButton(
                    buttonText: 'Add Recipient',
                    buttonIcon: Icon(Icons.person_4),
                  ),
                  CallToActionButton(
                    buttonText: 'Make Payment',
                    buttonIcon: Icon(Icons.payment),
                  ),
                  CallToActionButton(
                    buttonText: 'Send Groceries',
                    buttonIcon: Icon(Icons.shopping_bag),
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

  const CallToActionButton({
    super.key,
    required this.buttonText,
    required this.buttonIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => {},
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
