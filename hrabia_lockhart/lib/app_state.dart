import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hrabia_lockhart/cards.dart';

class AppState extends ChangeNotifier {
  int guideStage = 0;
  int preparationStage = 0;

  List<ClueCard> cards = [];
  List<ClueCard> chosenCards = [];
  Character? _killer;
  List<Character> characters = Character.values.toList();

  bool isKiller(Character character) {
    return character == _killer;
  }

  bool isCardChosen(ClueCard c) {
    return chosenCards.contains(c);
  }

  bool isCardChosenCharacterRoom(Character c, Room r) {
    return chosenCards.where((e) => e.character == c && e.room == r).isNotEmpty;
  }

  void setGuideStage(int value) {
    guideStage = value;
    notifyListeners();
  }

  void setPreparationStage(int value) {
    preparationStage = value;
    notifyListeners();
  }

  void prepareCards() {
    cards.clear();
    chosenCards.clear();
    List<Room> roomsOrder = Room.values.toList();
    roomsOrder.shuffle();
    for (Room room in roomsOrder) {
      List<ClueCard> roomsCards = [];
      for (Character character in Character.values) {
        roomsCards.add(ClueCard(character, room));
      }
      roomsCards.shuffle();
      cards.addAll(roomsCards);
    }

    //iterate 4 times over rooms
    for (int i = 0; i < 4; i++) {
      for (Room room in Room.values) {
        // choose a random card of a character that was chosen less than 3 times
        List<Character> possibleChoices = Character.values
            .where((character) => (chosenCards
                .where((c) => c.character == character && c.room == room)
                .isEmpty))
            .where((character) =>
                chosenCards
                    .where((card) => card.character == character)
                    .length <
                3)
            .toList();
        if (possibleChoices.isEmpty) {
          throw Exception("unable to choose a card");
        }
        possibleChoices.shuffle();
        chosenCards.add(cards.firstWhere((card) =>
            card.character == possibleChoices[0] && card.room == room));
      }
    }

    _killer = Character.values.firstWhere(
        (e) => chosenCards.where((c) => c.character == e).length == 2);
    characters.shuffle();
    notifyListeners();
  }

  void shuffleCards() {
    cards.shuffle();
    notifyListeners();
  }
}
