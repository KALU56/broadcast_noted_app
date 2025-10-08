import 'package:broadcast/features/auth/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:broadcast/features/auth/presentation/pages/login_page.dart';
import 'package:broadcast/features/auth/presentation/pages/register_page.dart';
import 'package:broadcast/features/auth/presentation/pages/splash_page.dart';


class AppRouter {
  static const splash = '/';
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case register:
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("404 - Page Not Found")),
          ),
        );
    }
  }
}
