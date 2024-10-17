import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hackathon/nav/navigation.dart';

void main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(
          initialLocation: Navigation.initial, routes: Navigation.routes),
      debugShowCheckedModeBanner: false,
    );
  }
}
