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
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Menu().options(
                      context,
                      Image.asset('images/ic_pokedex.png'),
                      'POKÉDEX',
                      1,
                    ),
                    SizedBox(height: 32),
                    Menu().options(
                      context,
                      Image.asset('images/ic_favorite_pokemon.png'),
                      'POKEMONS\nFAVORITOS',
                      2,
                    ),
                    SizedBox(height: 32),
                    Menu().options(
                      context,
                      Image.asset('images/ic_profile_master.png'),
                      'PERFIL',
                      3,
                      userLoggedId,
                    ),
                    SizedBox(height: 32),
                    Menu().options(
                      context,
                      Image.asset('images/ic_logout.png'),
                      'DESLOGAR',
                      4,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
