import 'package:flutter/material.dart';
import 'package:mukuru_app/projects/BottomAppBar.dart';
import 'package:mukuru_app/projects/customWidgets/delete_account.dart';
import 'package:mukuru_app/projects/customWidgets/profile_details_outline.dart';
import 'package:mukuru_app/projects/customWidgets/user_statistics.dart';
import 'package:mukuru_app/projects/providers/user_provider.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool editable = false;

  late final UserProvider userProvider = Provider.of<UserProvider>(context);
  List<Widget> widgets = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    widgets = [
      ProfileOutline(
        user: userProvider,
      ),
      UserStatistics(),
      DeleteAccount()
    ];
  }

  void toggleEditable() {
    setState(() {
      editable = !editable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
            itemCount: widgets.length,
            itemBuilder: (BuildContext context, int index) {
              return widgets[index];
            }),
        bottomNavigationBar: BottomBar(
          activePage: 'Profile',
        ),
      ),
    );
  }
}
