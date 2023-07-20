import 'package:flutter/material.dart';
import 'package:mukuru_app/projects/BottomAppBar.dart';

class UncollectedVouchers extends StatelessWidget {
  const UncollectedVouchers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('Uncollected'),
        ),
      ),
      bottomNavigationBar: BottomBar(activePage: 'uncollected'),
    );
  }
}
