class ClueCard {
  final Character character;
  final Room room;

  ClueCard(this.character, this.room);
}

enum Character {
  agent,
  actress,
  doctor,
  diplomat,
  journalist,
  valet,
  maid,
  //professor,
  //violinist,
}

enum Room {
  library,
  //boudoir,
  foyers,
  cabinet,
  //dining,
  laboratory,
  attic,
}
