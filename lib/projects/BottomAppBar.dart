import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mukuru_app/projects/colors.dart';
import 'package:mukuru_app/projects/customWidgets/navigation_button.dart';

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
      padding: EdgeInsets.only(left: 15, right: 10),
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavigationButton(
                    activePage: widget.activePage,
                    icon: Icons.home,
                    buttonName: 'Home',
                    URL: '/home'),
                NavigationButton(
                    activePage: widget.activePage,
                    icon: Icons.wallet,
                    buttonName: 'Vouchers',
                    URL: '/uncollected-vouchers'),
                NavigationButton(
                    activePage: widget.activePage,
                    icon: Icons.history,
                    buttonName: 'History',
                    URL: '/history'),
                NavigationButton(
                    activePage: widget.activePage,
                    icon: Icons.person,
                    buttonName: 'Profile',
                    URL: '/settings'),
              ],
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () => context.push('/home'),
                  splashColor: Colors.grey,
                  icon: Icon(Icons.logout_outlined,
                      color: MyAppColors.themeColor)),
            ],
          )
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }
}
