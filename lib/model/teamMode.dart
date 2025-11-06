class Team {
  final String name;
  int played;
  int win;
  int draw;
  int lost;
  int points;

  Team({
    required this.name,
    this.played = 0,
    this.draw = 0,
    this.lost = 0,
    this.points = 0,
    this.win = 0,
  });
}
