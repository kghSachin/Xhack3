import 'package:flutter/material.dart';
import 'package:frontend/features/auth/pages/sign_in.dart';
import 'package:frontend/features/auth/pages/sign_up_student.dart';
import 'package:frontend/features/auth/pages/sign_up_teacher.dart';
import 'package:frontend/features/home/main_page.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SignIn.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SignIn(),
      );
    case SignUpTeacher.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SignUpTeacher(),
      );
    case SignUpStudent.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SignUpStudent(),
      );
    case MainPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MainPage(),
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
