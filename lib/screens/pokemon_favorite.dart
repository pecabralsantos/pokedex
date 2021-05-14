import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/components/cards.dart';
import 'package:pokedex/components/dialogs.dart';
import 'package:pokedex/components/toolbar.dart';
import 'package:pokedex/components/wallpaper.dart';
import 'package:pokedex/controller/dao_controller.dart';
import 'package:pokedex/controller/service_controller.dart';

class PokemonFavorite extends StatefulWidget {
  @override
  _PokemonFavoriteState createState() => _PokemonFavoriteState();
}

class _PokemonFavoriteState extends State<PokemonFavorite> {
  final _daoController = DaoController();
  final _serviceController = ServiceController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _daoController.getListFavorites();
      _serviceController.getQueryPokemon();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(28, 33, 74, 0.8),
        centerTitle: true,
        title: Hero(
          tag: 2,
          child: Image.asset(
            'images/ic_pokeball.png',
            width: 35,
          ),
        ),
      ),
      body: Stack(
        children: [
          Wallpaper().backgroundPage(),
          Observer(
            builder: (_) {
              final listFavorites = _daoController.listFavorite;
              final listPokemons = _serviceController.pokemons;
              if (listPokemons?.isEmpty ?? true) {
                return Center(
                  child: Image.asset('images/loading.gif', width: 200),
                );
              } else if (listFavorites?.isEmpty ?? true) {
                return Center(
                  child: Container(
                    padding: EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade200,
                      border: Border.all(
                        color: Colors.blueGrey.shade800,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Text(
                      'Não existem\npokemons\nfavoritos',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: listFavorites.length,
                  itemBuilder: (_, index) {
                    var favorites = listFavorites[index];
                    var pokemons = listPokemons.firstWhere(
                        (e) => e.name == favorites.namePokemon,
                        orElse: () => Dialogs().serviceError(context));
                    return Cards().pokemon(context, pokemons);
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
