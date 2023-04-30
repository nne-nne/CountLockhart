import 'package:flutter/material.dart';
import 'package:hrabia_lockhart/fancy_text.dart';
import 'package:hrabia_lockhart/fonts.dart';
import 'package:hrabia_lockhart/images.dart';
import 'package:hrabia_lockhart/routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Hrabia Lockhart nie żyje!",
          style: TextStyle(fontFamily: Fonts.fancyFont, fontSize: 40),
        ),
        backgroundColor: Color.fromARGB(255, 1, 24, 16),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const FancyText("Gra mroczna jak Miłobądz"),
            Image.asset(Images.title),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.guidePage);
                    },
                    style: const ButtonStyle(
                      side: MaterialStatePropertyAll(
                          BorderSide(width: 1.0, color: Colors.white)),
                    ),
                    child: const FancyText("Instrukcja")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.gameSetUpPage);
                    },
                    style: const ButtonStyle(
                      side: MaterialStatePropertyAll(
                          BorderSide(width: 1.0, color: Colors.white)),
                    ),
                    child: const FancyText("Przygotowanie gry")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
