import 'package:flutter/material.dart';
import 'package:pokedex/components/menu.dart';
import 'package:pokedex/components/wallpaper.dart';

class MainMenu extends StatelessWidget {
  final int userLoggedId;

  MainMenu({Key key, @required this.userLoggedId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Wallpaper().backgroundPage(),
          Container(
            padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Menu().options(context, 'POKÉDEX', 1),
                Menu().options(context, 'POKEMONS\nFAVORITOS', 2),
                Menu().options(context, 'PERFIL', 3, userLoggedId),
                Menu().options(context, 'SAIR', 4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
