import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/home/main_page.dart';
import 'package:frontend/res/theme.dart';
import 'package:frontend/router.dart';

const apiKey = "AIzaSyC0zgCFtz4p-6gzDLMg2-Jvp-1IS4Ftchg";
void main() {
  Gemini.init(apiKey: apiKey, enableDebugging: true);
  runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: theme,
        onGenerateRoute: (routeSettings) => generateRoute(routeSettings),
        home: MainPage());
  }
}

