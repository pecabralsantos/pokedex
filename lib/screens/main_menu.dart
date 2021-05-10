import 'package:flutter/material.dart';
import 'package:pokedex/components/menu.dart';

class MainMenu extends StatelessWidget {
  final int userLoggedId;

  MainMenu({Key key, @required this.userLoggedId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(28, 33, 74, 0.8),
        centerTitle: true,
        title: Image.asset(
          'images/ic_pokeball.png',
          width: 35,
        ),
      ),
      body: Stack(
        children: [
          Container(
            child: Image.asset(
              'images/app_background.jpg',
              width: double.maxFinite,
              height: double.maxFinite,
              fit: BoxFit.fill,
            ),
          ),
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
                    SizedBox(height: 24),
                    Menu().options(
                      context,
                      Image.asset('images/ic_favorite_pokemon.png'),
                      'POKEMONS\nFAVORITOS',
                      2,
                    ),
                    SizedBox(height: 24),
                    Menu().options(
                      context,
                      Image.asset('images/ic_profile_master.png'),
                      'PERFIL',
                      3,
                      userLoggedId,
                    ),
                    SizedBox(height: 24),
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
