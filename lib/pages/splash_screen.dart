import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mukuru_app/projects/providers/user_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final UserProvider bindingInstance =
      Provider.of<UserProvider>(context, listen: false);

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (bindingInstance.user == null) {
        Future.delayed(Duration(seconds: 2), () => context.go('/login'));
      } else {
        Future.delayed(Duration(seconds: 2), () => context.go('/load-data'));
      }
    });
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
