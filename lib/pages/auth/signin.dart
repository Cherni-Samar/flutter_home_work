import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:workshop_4sim2_2526/pages/auth/reset_password.dart';
import 'package:workshop_4sim2_2526/pages/auth/signup.dart';
import 'package:workshop_4sim2_2526/pages/home/home.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  late String? _username;
  late String? _password;

  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  final String _baseUrl = "10.0.2.2:9090";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("S'authentifier"),
      ),
      body: Form(
        key: _keyForm,
        child: ListView(
          children: [
            Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Image.asset("assets/images/minecraft.jpg", width: 460, height: 215)),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 50, 10, 10),
              child: TextFormField(
                decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Username"),
                onSaved: (String? value) {
                  _username = value;
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Le username ne doit pas etre vide";
                  } else if (value.length < 5) {
                    return "Le username doit avoir au moins 5 caractères";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Mot de passe"),
                onSaved: (String? value) {
                  _password = value;
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Le mot de passe ne doit pas etre vide";
                  } else if (value.length < 5) {
                    return "Le mot de passe doit avoir au moins 5 caractères";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: ElevatedButton(
                  child: const Text("S'authentifier"),
                  onPressed: () {
                    if (_keyForm.currentState!.validate()) {
                      _keyForm.currentState!.save();

                      Map<String, dynamic> userData = {
                        "username": _username,
                        "password": _password,
                      };
                      Map<String, String> headers = {
                        "Content-Type": "application/json; charset=UTF-8",
                      };

                      http
                          .post(Uri.http(_baseUrl, "/user/signin"),headers: headers, body: json.encode(userData))
                      .then((http.Response response) {
                        if(response.statusCode == 200) {
                          Navigator.pushReplacementNamed(context, "/navTab");
                        } else {
                          String message = "";
                          if(response.statusCode == 401) {
                            message = "Username ou mot de passe incorrect";
                          } else {
                            message = "Une erreur est survenue, veuillez réessayer plus tard";
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
                    }
                  },
                )),
            Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  child: const Text("Créer un compte"),
                  onPressed: () {
                    Navigator.pushNamed(context, "/signup");
                  },
                )),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Mot de passe oublié ?"),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    child: Text("Cliquez ici", style: TextStyle(color: Colors.blue)),
                    onTap: () {
                      Navigator.pushNamed(context,"/resetPwd");
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}