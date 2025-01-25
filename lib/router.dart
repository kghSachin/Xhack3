import 'package:flutter/material.dart';
import 'package:frontend/features/auth/pages/sign_in.dart';
import 'package:frontend/features/auth/pages/sign_up.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SignIn.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SignIn(),
      );
    case SignUp.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SignUp(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Page not found'),
          ),
        ),
      );
  }
}
