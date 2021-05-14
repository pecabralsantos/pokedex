import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/components/cards.dart';
import 'package:pokedex/components/toolbar.dart';
import 'package:pokedex/components/wallpaper.dart';
import 'package:pokedex/controller/service_controller.dart';

class Pokemons extends StatefulWidget {
  @override
  _PokemonsState createState() => _PokemonsState();
}

class _PokemonsState extends State<Pokemons> {
  final _serviceController = ServiceController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _serviceController.getQueryPokemon();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar().appBar(),
      body: Stack(
        children: [
          Wallpaper().backgroundPage(),
          Observer(
            builder: (_) {
              final listPokemons = _serviceController.pokemons;
              if (listPokemons?.isEmpty ?? true) {
                return Center(
                  child: Image.asset('images/loading.gif', width: 200),
                );
              } else {
                return ListView.builder(
                  itemCount: listPokemons.length,
                  itemBuilder: (_, index) {
                    return Cards().pokemon(context, listPokemons[index]);
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
