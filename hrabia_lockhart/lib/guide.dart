import 'package:flutter/material.dart';
import 'package:hrabia_lockhart/app_state.dart';
import 'package:hrabia_lockhart/fancy_text.dart';
import 'package:hrabia_lockhart/fonts.dart';
import 'package:hrabia_lockhart/images.dart';
import 'package:hrabia_lockhart/routes.dart';
import 'package:hrabia_lockhart/tile.dart';
import 'package:provider/provider.dart';

class Guide extends StatelessWidget {
  const Guide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Instrukcja",
          style: TextStyle(fontFamily: Fonts.fancyFont, fontSize: 40),
        ),
        backgroundColor: const Color.fromARGB(255, 1, 24, 16),
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
                      title: "1. Proszę Państwa, trup...",
                      body: Column(
                        children: [
                          const FancyText(
                              "Hrabia Lockhart, zwany dalej denatem, zaprosił do swojej alpejskiej posiadłości grono znajomych, zwanych dalej podejrzanymi."),
                          Row(
                            children: [
                              Image.asset(
                                Images.actressPortrait,
                                width: 100,
                              ),
                              Image.asset(
                                Images.professorPortrait,
                                width: 100,
                              ),
                              Image.asset(
                                Images.diplomatPortrait,
                                width: 100,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                Images.agentPortrait,
                                width: 100,
                              ),
                              Image.asset(
                                Images.violinistPortrait,
                                width: 100,
                              ),
                              Image.asset(
                                Images.doctorPortrait,
                                width: 100,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                Images.valetPortrait,
                                width: 100,
                              ),
                              Image.asset(
                                Images.maidPortrait,
                                width: 100,
                              ),
                              Image.asset(
                                Images.journalistPortrait,
                                width: 100,
                              ),
                            ],
                          ),
                          const FancyText(
                              "Hrabia został utrupiony przy kominku. Goście w tym czasie w podejrzany sposób przemieszczali się po 7 pomieszczeniach rezydencji"),
                          Center(
                            child: Image.asset(
                              Images.attic,
                              width: 100,
                            ),
                          ),
                          Row(
                            children: [
                              Image.asset(
                                Images.cabinet,
                                width: 100,
                              ),
                              Image.asset(
                                Images.laboratory,
                                width: 100,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                Images.library,
                                width: 100,
                              ),
                              Image.asset(
                                Images.foyers,
                                width: 100,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Tile(
                      active: appState.guideStage == 1,
                      onPressed: () {
                        appState.setGuideStage(1);
                      },
                      title: "2. Cel gry...",
                      body: Column(
                        children: const [
                          FancyText(
                              "Hrabia Lockhart, zwany dalej denatem, zaprosił do swojej alpejskiej posiadłości grono znajomych, zwanych dalej podejrzanymi.")
                        ],
                      ),
                    ),
                    Tile(
                      active: appState.guideStage == 2,
                      onPressed: () {
                        appState.setGuideStage(2);
                      },
                      title: "3. Panel detektywa",
                      body: Column(
                        children: const [
                          FancyText(
                              "Hrabia Lockhart, zwany dalej denatem, zaprosił do swojej alpejskiej posiadłości grono znajomych, zwanych dalej podejrzanymi.")
                        ],
                      ),
                    ),
                    Tile(
                      active: appState.guideStage == 3,
                      onPressed: () {
                        appState.setGuideStage(3);
                      },
                      title: "4. Zadawanie pytań",
                      body: Column(
                        children: const [
                          FancyText(
                              "Hrabia Lockhart, zwany dalej denatem, zaprosił do swojej alpejskiej posiadłości grono znajomych, zwanych dalej podejrzanymi.")
                        ],
                      ),
                    ),
                    Tile(
                      active: appState.guideStage == 4,
                      onPressed: () {
                        appState.setGuideStage(4);
                      },
                      title: "5. Co teraz",
                      body: Column(
                        children: const [
                          FancyText(
                              "Hrabia Lockhart, zwany dalej denatem, zaprosił do swojej alpejskiej posiadłości grono znajomych, zwanych dalej podejrzanymi.")
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
