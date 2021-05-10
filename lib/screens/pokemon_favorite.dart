import 'package:flutter/material.dart';
import 'package:pokedex/components/toolbar.dart';
import 'package:pokedex/components/wallpaper.dart';

class PokemonFavorite extends StatefulWidget {
  @override
  _PokemonFavoriteState createState() => _PokemonFavoriteState();
}

class _PokemonFavoriteState extends State<PokemonFavorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar().appBar(true),
      body: Stack(
        children: [
          Wallpaper().background(),
          Center(
            child: Text('POKEMONS FAVORITOS'),
          ),
        ],
      ),
    );
  }
}
