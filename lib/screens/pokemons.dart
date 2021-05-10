import 'package:flutter/material.dart';
import 'package:pokedex/components/toolbar.dart';
import 'package:pokedex/components/wallpaper.dart';

class Pokemons extends StatefulWidget {
  @override
  _PokemonsState createState() => _PokemonsState();
}

class _PokemonsState extends State<Pokemons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar().appBar(true),
      body: Stack(
        children: [
          Wallpaper().background(),
        ],
      ),
    );
  }
}
