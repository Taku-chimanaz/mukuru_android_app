import 'package:flutter/material.dart';
import 'package:mukuru_app/projects/BottomAppBar.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('Settings'),
        ),
      ),
      bottomNavigationBar: BottomBar(
        activePage: 'settings',
      ),
    );
  }
}
