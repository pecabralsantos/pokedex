import 'package:flutter/material.dart';

class Favorite {
  num id;
  final String namePokemon;

  Favorite({@required this.namePokemon});

  Map<String, dynamic> toMap() {
    return {
      'namePokemon': namePokemon,
    };
  }

  static Favorite fromMap(Map<String, dynamic> map) {
    return Favorite(
      namePokemon: map['namePokemon'],
    );
  }
}
