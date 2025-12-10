import 'package:flutter/material.dart';

import '../../entities/game.dart';
import 'element_info.dart';

class Basket extends StatefulWidget {
  const Basket();

  @override
  State<Basket> createState() => _BasketState();
}

class _BasketState extends State<Basket> {
  final List<Game> _games = [];
  final String _description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
      "sed do eiusmod tempor incididunt ut "
      "labore et dolore magna aliqua. Ut enim ad minim veniam, "
      "quis nostrud exercitation ullamco laboris nisi ut "
      "aliquip ex ea commodo consequat. Duis aute irure dolor "
      "in reprehenderit in voluptate velit esse cillum dolore "
      "eu fugiat nulla pariatur. Excepteur sint occaecat "
      "cupidatat non proident, sunt in culpa qui officia "
      "deserunt mollit anim id est laborum.";

  @override
  void initState() {
    _games.add(Game("Devil May Cry", _description, "assets/images/dmc5.jpg", 200, 3000));
    _games.add(Game("Resident Evil VIII", _description, "assets/images/re8.jpg", 200, 3000));
    _games.add(Game("Need For Speed Heat", _description, "assets/images/nfs.jpg", 100, 3000));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Total : 500 TND",
              textScaleFactor: 1.5,
            )
          ],
        ),
        Container(margin: const EdgeInsets.fromLTRB(20, 0, 20, 0), child: const Divider(color: Colors.red)),
        Expanded(
            child: ListView.builder(
                itemCount: _games.length,
                itemBuilder: (BuildContext context, int index) {
                  return ElementInfo(_games[index]);
                }))
      ],
    );
  }
}