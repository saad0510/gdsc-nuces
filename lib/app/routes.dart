import 'package:flutter/material.dart';

import '../features/auth/screens/auth_screen.dart';
import '../features/auth/screens/home_screen.dart';
import '../features/auth/screens/splash_screen.dart';

enum AppRoutes {
  splash,
  auth,
  home;

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
          builder: (_) => const AuthScreen(),
        );
      case home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
    }
  }
}
