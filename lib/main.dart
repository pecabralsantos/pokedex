import 'package:flutter/material.dart';
import 'package:pokedex/screens/splash.dart';

void main() => runApp(Pokedex());

class Pokedex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Pokemon'),
      home: Splash(),
    );
  }
}
