import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../entities/game.dart';

class ProductDetails extends StatefulWidget {
  final Game _game;

  const ProductDetails(this._game, {super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final String _baseUrl = "10.0.2.2:9090";

  late int _currentQuantity;

  @override
  void initState() {
    _currentQuantity = widget._game.quantity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._game.title),
      ),
      body: Column(
        children: [
          Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Image.network("http://10.0.2.2:9090/img/${widget._game.image}", width: 460, height: 215)),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 50),
            child: Text(widget._game.description),
          ),
          Text("${widget._game.price} TND", textScaleFactor: 3),
          Text("Exemplaires disponibles : $_currentQuantity"),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_basket_rounded),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Acheter", textScaleFactor: 2)
                ],
              ),
              onPressed: () {
                http
                    .get(Uri.http(_baseUrl, "/library/693930fb892aa11e090dcaf2/693930fb892aa11e090dcae7"))
                    .then((response) {
                      if(response.statusCode == 200) {
                        dynamic body = json.decode(response.body);
                        String message = "";
                        if(int.parse(body['count'].toString()) != 0) {
                          message = "Vous avez déjà acheté ce jeu.";
                        }
                        else {
                          message = "Le jeu a été ajouté au panier.";
                        }
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title:  Text("Information"),
                                content: Text(message),
                              );
                            }
                        );
                      }
                });
              },
            ),
          )
        ],
      ),
    );
  }
}