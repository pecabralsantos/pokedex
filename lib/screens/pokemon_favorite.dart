import 'package:flutter/material.dart';

class PokemonFavorite extends StatefulWidget {
  const PokemonFavorite({Key key}) : super(key: key);

  @override
  _PokemonFavoriteState createState() => _PokemonFavoriteState();
}

class _PokemonFavoriteState extends State<PokemonFavorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('POKEMONS FAVORITOS')),
    );
  }
}
