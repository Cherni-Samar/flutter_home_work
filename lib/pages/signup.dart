import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inscription"),
      ),
      body: Column(
        children: [
          Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Image.asset("assets/images/minecraft.jpg", width: 460, height: 215)),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: const TextField(
              decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Username"),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: const TextField(
              decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Email"),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: const TextField(
              decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Mot de passe"),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: const TextField(
              decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Année de naissance"),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
            child: const TextField(
              decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Adresse de facturation"),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text("S'inscrire"),
                onPressed: () {},
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                child: const Text("Annuler"),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}