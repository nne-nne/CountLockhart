import 'package:flutter/material.dart';
import 'package:hrabia_lockhart/app_state.dart';
import 'package:hrabia_lockhart/guide.dart';
import 'package:hrabia_lockhart/routes.dart';
import 'package:hrabia_lockhart/set_up_game.dart';
import 'package:hrabia_lockhart/welcome.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  PageRouteBuilder pageRoute(dynamic settings, Widget page) => PageRouteBuilder(
        settings: settings,
        pageBuilder: (_, __, ___) => page,
        transitionsBuilder: (_, a, __, c) =>
            FadeTransition(opacity: a, child: c),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hrabia Lockhart nie żyje!',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 12, 61, 38),
        secondaryHeaderColor: const Color.fromARGB(255, 9, 17, 4),
      ),
      home: const WelcomeScreen(),
      initialRoute: Routes.welcomeScreen,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case Routes.welcomeScreen:
            return pageRoute(settings, const WelcomeScreen());
          case Routes.guidePage:
            return pageRoute(settings, const Guide());
          case Routes.gameSetUpPage:
            return pageRoute(settings, const SetUpGame());
          default:
            return pageRoute(settings, const WelcomeScreen());
        }
      },
    );
  }
}
