import 'package:flutter/material.dart';
import 'package:pokedex/components/menu.dart';
import 'package:pokedex/components/toolbar.dart';
import 'package:pokedex/components/wallpaper.dart';

class MainMenu extends StatelessWidget {
  final int userLoggedId;

  MainMenu({Key key, @required this.userLoggedId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar().appBar(false),
      body: Stack(
        children: [
          Wallpaper().background(),
          Container(
            padding: EdgeInsets.fromLTRB(40, 8, 40, 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Menu().options(
                      context,
                      Image.asset('images/ic_pokedex.png'),
                      'POKÉDEX',
                      1,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Menu().options(
                      context,
                      Image.asset('images/ic_favorite_pokemon.png'),
                      'POKEMONS\nFAVORITOS',
                      2,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Menu().options(
                      context,
                      Image.asset('images/ic_profile_master.png'),
                      'PERFIL',
                      3,
                      userLoggedId,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Menu().options(
                      context,
                      Image.asset('images/ic_logout.png'),
                      'DESLOGAR',
                      4,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
