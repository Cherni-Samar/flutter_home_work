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
      home: Signup(),
      // home: Signin(),
      // home: ProductDetails("assets/images/dmc5.jpg", "Devil May Cry 5", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla est nisl, sollicitudin ac sodales eget, lacinia ut libero. Sed libero nisl, sodales et quam ultrices, lacinia laoreet erat. Maecenas iaculis consequat enim id dignissim. Aliquam hendrerit porttitor quam, non accumsan mi varius vel. Aenean fringilla et felis quis sodales. Nam et nisi blandit, accumsan lectus vulputate, tristique neque.", 250, 3000)
    );
  }
}
