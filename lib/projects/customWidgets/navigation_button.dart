import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mukuru_app/projects/colors.dart';

class NavigationButton extends StatefulWidget {
  final String activePage;
  final String buttonName;
  final IconData icon;
  final String URL;
  const NavigationButton(
      {super.key,
      required this.activePage,
      required this.buttonName,
      required this.URL,
      required this.icon});

  @override
  State<NavigationButton> createState() => _NavigationButtonState();
}

class _NavigationButtonState extends State<NavigationButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () => context.push(widget.URL),
              splashColor: Colors.grey,
              icon: Icon(
                widget.icon,
                color: MyAppColors.primaryColor,
                size: 20,
              )),
          Container(
            child: Text(
              widget.buttonName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: widget.activePage == widget.buttonName
                    ? MyAppColors.themeColor
                    : null,
              ),
            ),
            transform: Matrix4.translationValues(0, -10, 0),
          )
        ]);
  }
}
