import 'package:flutter/material.dart';

import 'pages/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "G-STORE ESPRIT",
      debugShowCheckedModeBanner: false,
      home: const SignUpPage(), // l'app démarre sur SignUp
    );
  }
}
