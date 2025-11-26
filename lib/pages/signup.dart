import 'package:flutter/material.dart';

import 'signin.dart'; // Import de la page Signin

class Signup extends StatefulWidget {
  const Signup({super. key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late String _username;
  late String _email;
  late String _password;
  late int _birthYear;
  late String _address;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inscription"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Image. asset(
                "assets/images/minecraft.jpg",
                width: 460,
                height: 215,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 460,
                    height: 215,
                    color: Colors.grey. shade300,
                    child: const Icon(Icons.image, size: 50, color: Colors.grey),
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Username"
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Le nom d'utilisateur ne peut pas être vide.";
                  }
                  if (value.length < 5) {
                    return "Le nom d'utilisateur doit contenir au moins 5 caractères.";
                  }
                  return null;
                },
                onSaved: (String? value) {
                  _username = value!;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets. fromLTRB(10, 0, 10, 10),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email"
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "L'email ne peut pas être vide.";
                  }
                  RegExp regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                  if (!regex.hasMatch(value)) {
                    return "Veuillez entrer une adresse email valide.";
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Mot de passe"
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Le mot de passe ne peut pas être vide.";
                  }
                  if (value.length < 5) {
                    return "Le mot de passe doit contenir au moins 5 caractères.";
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value!;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets. fromLTRB(10, 0, 10, 10),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Année de naissance"
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "L'année de naissance ne peut pas être vide.";
                  }
                  if (value.length < 4) {
                    return "Veuillez entrer une année valide (4 chiffres).";
                  }
                  try {
                    int year = int.parse(value);
                    if (year > 2025 || year < 1900) {
                      return "Veuillez entrer une année de naissance valide.";
                    }
                  } catch (e) {
                    return "Veuillez entrer un nombre valide.";
                  }
                  return null;
                },
                onSaved: (value) {
                  _birthYear = int.parse(value!);
                },
              ),
            ),
            Container(
              margin: const EdgeInsets. fromLTRB(10, 0, 10, 20),
              child: TextFormField(
                maxLines: 4,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Adresse de facturation"
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "L'adresse de facturation ne peut pas être vide.";
                  }
                  if (value.length < 20) {
                    return "L'adresse doit contenir au moins 20 caractères.";
                  }
                  return null;
                },
                onSaved: (value) {
                  _address = value!;
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Text("S'inscrire"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState! .save();
                      String message = "Username: $_username\nEmail: $_email\nMot de passe: $_password\nAnnée de naissance: $_birthYear\nAdresse de facturation: $_address";
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Inscription réussie"),
                            content: Text(message),
                            actions: [
                              TextButton(
                                child: const Text("OK"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  // Rediriger vers Signin après inscription
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Signin(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  child: const Text("Annuler"),
                  onPressed: () {
                    _formKey.currentState!. reset();
                  },
                )
              ],
            ),
            // Lien vers Signin
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Vous avez déjà un compte ? "),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator. push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Signin(),
                        ),
                      );
                    },
                    child: const Text(
                      "Se connecter",
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}