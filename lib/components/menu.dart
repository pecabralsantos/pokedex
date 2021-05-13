import 'package:flutter/material.dart';
import 'package:pokedex/screens/pokemon_favorite.dart';
import 'package:pokedex/screens/pokemons.dart';
import 'package:pokedex/screens/profile.dart';

class Menu {
  options(BuildContext context, String title, int options, [int userLoggedId]) {
    return InkWell(
      child: Container(
        width: double.maxFinite,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade200,
          border: Border.all(
            color: Colors.blueGrey.shade800,
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Stack(
          children: [
            Container(
              alignment: AlignmentDirectional.centerEnd,
              child: Image.asset(
                'images/ic_background_pokeball.png',
                color: Colors.white24,
                width: 125,
                height: 125,
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              alignment: AlignmentDirectional.centerStart,
              padding: EdgeInsets.only(left: 24),
              child: Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
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
