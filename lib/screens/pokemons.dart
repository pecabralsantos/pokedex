import 'package:flutter/material.dart';

class Pokemons extends StatefulWidget {
  const Pokemons({Key key}) : super(key: key);

  @override
  _PokemonsState createState() => _PokemonsState();
}

class _PokemonsState extends State<Pokemons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('POKÉDEX')),
    );
  }
}
