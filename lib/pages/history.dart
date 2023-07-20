import 'package:flutter/material.dart';
import 'package:mukuru_app/projects/BottomAppBar.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Center(
          child: Text('Profile'),
        ),
      )),
      bottomNavigationBar: BottomBar(activePage: 'history'),
    );
  }
}
