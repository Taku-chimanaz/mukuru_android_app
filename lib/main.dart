import 'package:flutter/material.dart';
import 'package:mukuru_app/projects/providers/user_provider.dart';
import 'package:mukuru_app/projects/routes/app_route_config.dart';
import 'package:mukuru_app/states.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => VouchersProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider())
      ],
      child: MaterialApp.router(
        routerConfig: MyAppRouter().router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
