import 'package:flutter/material.dart';

import '../../entities/game.dart';
import 'my_game_info.dart';

class MyGames extends StatefulWidget {
  const MyGames();

  @override
  State<MyGames> createState() => _MyGamesState();
}

class _MyGamesState extends State<MyGames> {
  final List<Game> _games = [];
  String _description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nisl eros, pulvinar facilisis justo mollis, auctor consequat urna. Morbi a bibendum metus. Donec scelerisque sollicitudin enim eu venenatis. Duis tincidunt laoreet ex, in pretium orci vestibulum eget.";

  @override
  void initState() {
    _games.add(Game("Devil May Cry", _description, "assets/images/dmc5.jpg", 200, 3000));
    _games.add(Game("Resident Evil VIII", _description, "assets/images/re8.jpg", 200, 3000));
    _games.add(Game("Need For Speed Heat", _description, "assets/images/nfs.jpg", 100, 1500));
    _games.add(Game("RDR 2", _description, "assets/images/rdr2.jpg", 150, 2500));
    _games.add(Game("FIFA 22", _description, "assets/images/fifa.jpg", 100, 5000));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _games.length,
      itemBuilder: (BuildContext context, int index) {
        return MyGameInfo(_games[index]);
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          mainAxisExtent: 120
      ),
    );
  }
}
