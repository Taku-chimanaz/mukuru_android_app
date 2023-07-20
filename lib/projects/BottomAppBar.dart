import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mukuru_app/projects/colors.dart';

class BottomBar extends StatefulWidget {
  final String activePage;
  const BottomBar({
    super.key,
    required this.activePage,
  });

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        children: [
          IconButton(
              onPressed: () => context.push('/home'),
              splashColor: Colors.grey,
              icon: Icon(
                Icons.home,
                color: widget.activePage == 'home' ? MyAppColors.color : null,
              )),
          IconButton(
              onPressed: () {
                context.push('/uncollected-vouchers');
              },
              icon: Icon(
                Icons.account_balance_wallet,
                color: widget.activePage == 'uncollected'
                    ? MyAppColors.color
                    : null,
              )),
          IconButton(
              onPressed: () => context.push('/history'),
              icon: Icon(
                Icons.history,
                color:
                    widget.activePage == 'history' ? MyAppColors.color : null,
              )),
          IconButton(
              onPressed: () => context.push('/settings'),
              icon: Icon(
                Icons.settings,
                color:
                    widget.activePage == 'settings' ? MyAppColors.color : null,
              ))
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
    );
  }
}
