import 'package:flutter/material.dart';
import 'package:hrabia_lockhart/card_desc.dart';
import 'package:hrabia_lockhart/cards.dart';

import 'fancy_text.dart';

class RevealButton extends StatelessWidget {
  final Character character;
  final bool isKiller;
  final String title;

  const RevealButton(
      {super.key,
      required this.character,
      required this.isKiller,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      onLongPress: () => _dialogBuilder(context, character, isKiller),
      style: ButtonStyle(
        fixedSize: const MaterialStatePropertyAll(Size(80, 80)),
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        )),
        backgroundColor:
            const MaterialStatePropertyAll(Color.fromARGB(255, 26, 23, 23)),
      ),
      child: Image.asset(
        CardDesc.portraits[character]!,
        width: 100,
      ),
    );
  }

  Future<void> _dialogBuilder(
      BuildContext context, Character character, bool isKiller) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: isKiller
              ? Color.fromARGB(255, 1, 24, 16)
              : Color.fromARGB(255, 46, 3, 16),
          title: Center(child: const FancyText('Tożsamość reveal party')),
          content: Column(
            children: [
              Image.asset(CardDesc.portraits[character]!),
              FancyText(isKiller
                  ? "Pure genius, Holmes! Tryumfujesz!"
                  : "pudło, a kolejny trup to Ty! Odpadasz z gry"),
            ],
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const FancyText('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
