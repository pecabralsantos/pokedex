import 'package:flutter/material.dart';
import 'package:pokedex/screens/pokemon_favorite.dart';
import 'package:pokedex/screens/pokemons.dart';
import 'package:pokedex/screens/profile.dart';

class Menu {
  options(BuildContext context, Image icon, String title, int options,
      [int userLoggedId]) {
    return InkWell(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 125,
            height: 125,
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade200,
              border: Border.all(
                color: Colors.blueGrey.shade800,
                width: 1,
              ),
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            child: icon,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ],
      ),
      onTap: () {
        switch (options) {
          case 1:
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Pokemons(),
                ));
            break;
          case 2:
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PokemonFavorite(),
                ));
            break;
          case 3:
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Profile(userLoggedId: userLoggedId),
                ));
            break;
          default:
            Navigator.pop(context);
        }
      },
    );
  }
}
