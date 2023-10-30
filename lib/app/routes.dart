import 'package:flutter/material.dart';

import '../features/auth/screens/splash_screen.dart';
import '../theme_test_screen.dart';

enum AppRoutes {
  splash,
  auth;

  static const initial = splash;

  static Route<dynamic> onGenerateRoute(RouteSettings route) {
    final appRoute = values.byName(route.name!);

    switch (appRoute) {
      case splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case auth:
        return MaterialPageRoute(
          builder: (_) => const ThemeTestScreen(),
        );
    }
  }
}
