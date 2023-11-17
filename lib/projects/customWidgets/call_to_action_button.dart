import 'package:flutter/material.dart';
import 'package:mukuru_app/projects/colors.dart';

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
