import 'package:flutter/material.dart';
import 'package:mukuru_app/projects/BottomAppBar.dart';
import 'package:mukuru_app/projects/customWidgets/user_details.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [UserDetails()],
      )),
      bottomNavigationBar: BottomBar(
        activePage: 'home',
      ),
    );
  }
}
