import 'package:flutter/material.dart';

class Favorite {
  num id;
  final num idPokemon;
  bool isFavorite = false;

  Favorite({@required this.idPokemon, @required this.isFavorite});

  Map<String, dynamic> toMap() {
    return {
      'idPokemon': idPokemon,
      'isFavorite': isFavorite,
    };
  }

  static Favorite fromMap(Map<String, dynamic> map) {
    return Favorite(
      idPokemon: map['idPokemon'],
      isFavorite: false,
    );
  }
}
