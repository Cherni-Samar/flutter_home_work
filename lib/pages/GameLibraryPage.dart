import 'package:flutter/material.dart';

import '../../entities/game.dart';

class GameLibraryPage extends StatefulWidget {
  const GameLibraryPage({super.key});

  @override
  State<GameLibraryPage> createState() => _GameLibraryPageState();
}

class _GameLibraryPageState extends State<GameLibraryPage> {
  final List<Game> _games = [];
  final String _description = "Description du jeu";

  @override
  void initState() {
    super.initState();
    _games.add(Game("Devil May Cry 5", _description, "assets/images/dmc5.jpg", 200, 2000));
    _games.add(Game("RE VIII", _description, "assets/images/re8.jpg", 200, 4000));
    _games.add(Game("RDR 2", _description, "assets/images/rdr2.jpg", 150, 5000));
    _games.add(Game("NFS Heat", _description, "assets/images/nfs.jpg", 100, 6000));
    _games.add(Game("FIFA 22", _description, "assets/images/fifa.jpg", 100, 3000));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ma bibliothèque"), backgroundColor: Colors.blue),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 0.75, crossAxisSpacing: 12, mainAxisSpacing: 12
        ),
        itemCount: _games.length,
        itemBuilder: (context, index) {
          final game = _games[index];
          return GameCard(game: game);
        },
      ),
    );
  }
}

class GameCard extends StatelessWidget {
  final Game game;

  const GameCard({required this.game, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${game.title} cliqué')));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 4, offset: const Offset(0, 2))]),
              child: ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.asset(game.image, fit: BoxFit.cover, errorBuilder: (c, e, s) => Container(color: Colors.grey[300], child: const Icon(Icons.image_not_supported)))),
            ),
          ),
          const SizedBox(height: 8),
          Text(game.title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500), maxLines: 2, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}
