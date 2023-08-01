import 'package:go_router/go_router.dart';
import 'package:mukuru_app/pages/history.dart';
import 'package:mukuru_app/pages/load_data_page.dart';
import 'package:mukuru_app/pages/settings.dart';
import 'package:mukuru_app/pages/home.dart';
import 'package:mukuru_app/pages/splash_screen.dart';
import 'package:mukuru_app/pages/uncollected_vouchers.dart';

class MyAppRouter {
  final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => SplashScreen()),
    GoRoute(path: '/load-data', builder: (context, state) => LoadData()),
    GoRoute(path: '/home', builder: (context, state) => Home()),
    GoRoute(
        path: '/uncollected-vouchers',
        builder: (context, state) => UncollectedVouchers()),
    GoRoute(path: '/history', builder: (context, state) => History()),
    GoRoute(path: '/settings', builder: (context, state) => Settings()),
  ]);
}
