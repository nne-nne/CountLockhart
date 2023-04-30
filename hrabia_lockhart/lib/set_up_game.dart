import 'package:flutter/material.dart';
import 'package:hrabia_lockhart/app_state.dart';
import 'package:hrabia_lockhart/cards.dart';
import 'package:hrabia_lockhart/fancy_text.dart';
import 'package:hrabia_lockhart/reveal_button.dart';
import 'package:hrabia_lockhart/routes.dart';
import 'package:hrabia_lockhart/tile.dart';
import 'package:provider/provider.dart';

import 'card_desc.dart';
import 'fonts.dart';
import 'images.dart';

class SetUpGame extends StatelessWidget {
  const SetUpGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Przygotowanie gry",
          style: TextStyle(fontFamily: Fonts.fancyFont, fontSize: 40),
        ),
        backgroundColor: Color.fromARGB(255, 1, 24, 16),
      ),
      body: Consumer<AppState>(
        builder: (context, appState, child) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                height: 550,
                child: ListView(
                  children: [
                    Tile(
                      active: appState.guideStage == 0,
                      onPressed: () {
                        appState.setGuideStage(0);
                      },
                      title: "1. Ustawienie kolejności kart",
                      body: Column(
                        children: [
                          TextButton(
                              onPressed: () {
                                appState.prepareCards();
                              },
                              style: const ButtonStyle(
                                side: MaterialStatePropertyAll(BorderSide(
                                    width: 1.0, color: Colors.white)),
                              ),
                              child: const FancyText("Potasuj karty")),
                          SizedBox(
                            height: 380,
                            child: ListView(
                              children: appState.cards
                                  .map((e) => Row(
                                        children: [
                                          FancyText(
                                            (appState.cards.indexOf(e) + 1)
                                                .toString(),
                                            fontSize: 20,
                                          ),
                                          CardDesc(card: e),
                                        ],
                                      ))
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Tile(
                      active: appState.guideStage == 1,
                      onPressed: () {
                        appState.setGuideStage(1);
                      },
                      title: "2. Selekcja kart do gry",
                      body: Column(
                        children: [
                          SizedBox(
                            height: 380,
                            width: 200,
                            child: ListView(
                              children: appState.cards
                                  .map(
                                    (e) => Row(
                                      children: [
                                        FancyText(
                                          (appState.cards.indexOf(e) + 1)
                                              .toString(),
                                          fontSize: 30,
                                        ),
                                        appState.isCardChosen(e)
                                            ? const Icon(
                                                Icons.check,
                                                color: Color.fromARGB(
                                                    255, 132, 182, 15),
                                              )
                                            : const Icon(
                                                Icons.close,
                                                color: Color.fromARGB(
                                                    255, 97, 15, 15),
                                              )
                                      ],
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Tile(
                      active: appState.guideStage == 2,
                      onPressed: () {
                        appState.setGuideStage(2);
                      },
                      title: "3. Tożsamości graczy",
                      body: Column(
                        children: [
                          SizedBox(
                              height: 400,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RevealButton(
                                        character: appState.characters[0],
                                        isKiller: appState
                                            .isKiller(appState.characters[0]),
                                        title: "1",
                                      ),
                                      RevealButton(
                                        character: appState.characters[1],
                                        isKiller: appState
                                            .isKiller(appState.characters[1]),
                                        title: "2",
                                      ),
                                      RevealButton(
                                        character: appState.characters[2],
                                        isKiller: appState
                                            .isKiller(appState.characters[2]),
                                        title: "3",
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RevealButton(
                                        character: appState.characters[3],
                                        isKiller: appState
                                            .isKiller(appState.characters[3]),
                                        title: "4",
                                      ),
                                      RevealButton(
                                        character: appState.characters[4],
                                        isKiller: appState
                                            .isKiller(appState.characters[4]),
                                        title: "5",
                                      ),
                                      RevealButton(
                                        character: appState.characters[5],
                                        isKiller: appState
                                            .isKiller(appState.characters[5]),
                                        title: "6",
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RevealButton(
                                        character: appState.characters[6],
                                        isKiller: appState
                                            .isKiller(appState.characters[6]),
                                        title: "7",
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
