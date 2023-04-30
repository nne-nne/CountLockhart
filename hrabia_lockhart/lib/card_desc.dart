import 'package:flutter/material.dart';
import 'package:hrabia_lockhart/cards.dart';
import 'package:hrabia_lockhart/fancy_text.dart';
import 'package:hrabia_lockhart/images.dart';

class CardDesc extends StatelessWidget {
  final ClueCard card;

  const CardDesc({super.key, required this.card});

  static Map<Character, String> names = {
    Character.agent: "Agent",
    Character.actress: "Aktorka",
    Character.doctor: "Doktor",
    Character.diplomat: "Dyplomata",
    Character.journalist: "Dziennikarz",
    Character.valet: "Lokaj",
    Character.maid: "Pokojówka",
    //Character.professor: "Profesor",
    //Character.violinist: "Skrzypaczka",
  };

  static Map<Character, String> portraits = {
    Character.agent: Images.agentPortrait,
    Character.actress: Images.actressPortrait,
    Character.doctor: Images.doctorPortrait,
    Character.diplomat: Images.diplomatPortrait,
    Character.journalist: Images.journalistPortrait,
    Character.valet: Images.valetPortrait,
    Character.maid: Images.maidPortrait,
    //Character.professor: Images.professorPortrait,
    //Character.violinist: Images.violinistPortrait,
  };

  static Map<Room, String> rooms = {
    Room.library: "Biblioteka",
    //Room.boudoir: "Boudoir",
    Room.foyers: "Foyers",
    Room.cabinet: "Gabinet",
    //Room.dining: "Jadalnia",
    Room.laboratory: "Laboratorium",
    Room.attic: "Poddasze",
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Image.asset(
            portraits[card.character]!,
            width: 40,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: FancyText(names[card.character]!),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: FancyText(rooms[card.room]!),
        ),
      ],
    );
  }
}
