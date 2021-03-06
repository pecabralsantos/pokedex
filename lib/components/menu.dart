import 'package:flutter/material.dart';
import 'package:pokedex/components/wallpaper.dart';
import 'package:pokedex/screens/favorite_pokemons.dart';
import 'package:pokedex/screens/pokedex_page.dart';
import 'package:pokedex/screens/profile.dart';

class Menu {
  options(BuildContext context, String title, int options, [int userLoggedId]) {
    return InkWell(
      child: Container(
        width: double.maxFinite,
        height: 100,
        decoration: BoxDecoration(
          color: Wallpaper().optionsColor(options),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              spreadRadius: 4,
              blurRadius: 3,
              offset: Offset(0.5, 0.5),
            ),
          ],
        ),
        child: Stack(
          children: [
            Container(
              alignment: AlignmentDirectional.centerEnd,
              child: Hero(
                tag: options,
                child: Image.asset(
                  'images/ic_background_pokeball.png',
                  color: Colors.white24,
                  width: 125,
                  height: 125,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Container(
              alignment: AlignmentDirectional.centerStart,
              padding: EdgeInsets.only(left: 24),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
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
                  builder: (_) => PokedexPage(),
                ));
            break;
          case 2:
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => FavoritePokemons(),
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
