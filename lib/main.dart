import 'package:flutter/material.dart';
import 'package:frontend/features/auth/pages/map_page.dart';
import 'package:frontend/features/auth/pages/sign_in.dart';
import 'package:frontend/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: (routeSettings)=>generateRoute(routeSettings),
      home: SignIn()
    );
  }
}