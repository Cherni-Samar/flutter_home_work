import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:workshop_4sim2_2526/pages/auth/update_user.dart';

import '../../entities/game.dart';
import 'product_info.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Game> _games = [];
  final String _baseUrl = "10.0.2.2:9090";
  late Future<bool> _fetchedGames;

  Future<bool> _fetchGames() async {
    http.Response response = await http.get(Uri.http(_baseUrl, "/game"));
    if(response.statusCode == 200) {
      final List<dynamic> _gamesFromServer = json.decode(response.body);
      _gamesFromServer.forEach((element) {
        _games.add(Game(element['title'], element['description'], element['image'],
            int.parse(element['price'].toString()), int.parse(element['quantity'].toString())));
      });
    }
    return true;
  }

  @override
  void initState() {
    _fetchedGames = _fetchGames();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _fetchedGames,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if(snapshot.hasData) {
            return ListView.builder(
              itemCount: _games.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductInfo(_games[index]);
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
    );
  }
}
