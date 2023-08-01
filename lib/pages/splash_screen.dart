import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () => context.go('/load-data'));
  }

  @override
  Widget build(BuildContext context) {
    String backgroundColorString = "#ef4e22";
    Color color = Color(
        int.parse(backgroundColorString.substring(1, 7), radix: 16) +
            0xFF000000);
    return Container(
      color: color,
      child: Center(
        child: Image.asset('assets/images/mukuru_logo.jpeg'),
      ),
    );
  }
}
