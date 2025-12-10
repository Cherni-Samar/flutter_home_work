import 'package:flutter/material.dart';

import '../../entities/game.dart';

class ElementInfo extends StatelessWidget {
  final Game _game;

  const ElementInfo(this._game, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.restore_from_trash_rounded,
              size: 50,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Image.asset(_game.image, width: 155, height: 58),
            ),
            Text(
              "${_game.price} TND",
              textScaleFactor: 2,
            ),
          ],
        ),
      ),
    );
  }
}
