import 'package:flutter/material.dart';

import 'cart.dart'; // Import de la page Cart
import 'reset_password.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  late String _username;
  late String _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("S'authentifier"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Container(
                width: double. infinity,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Image.asset("assets/images/minecraft.jpg", width: 460, height: 215)),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 50, 10, 10),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(), 
                  labelText: "Username"
                ),
                validator: (String? value) {
                  if(value == null || value.isEmpty) {
                    return "Veuillez entrer votre nom d'utilisateur. ";
                  }
                  if(value.length < 5) {
                    return "Le nom d'utilisateur doit contenir au moins 5 caractères.  ";
                  }
                  return null;
                },
                onSaved: (String? value) {
                  _username = value!;
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
                validator: (String?  value) {
                  if(value == null || value.isEmpty) {
                    return "Veuillez entrer votre mot de passe.";
                  }
                  if(value.length < 5) {
                    return "Le mot de passe doit contenir au moins 5 caractères.";
                  }
                  return null;
                },
                onSaved: (String?  value) {
                  _password = value!;
                },
              ),
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: ElevatedButton(
                  child: const Text("S'authentifier"),
                  onPressed: () {
                    if(_formKey.currentState! .validate()) {
                      _formKey.currentState!.save();
                      
                      // Navigation directe vers la page Cart
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Cart(),
                        ),
                      );
                    }
                  },
                )),
            Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(Colors. red),
                  ),
                  child: const Text("Créer un compte"),
                  onPressed: () {
                    // Navigation vers la page Signup
                  },
                )),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Mot de passe oublié ?"),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResetPassword(),
                        ),
                      );
                    },
                    child: const Text(
                      "Cliquez ici", 
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      )
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}