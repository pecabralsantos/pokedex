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
      appBar: Toolbar().appBar(true),
      body: Stack(
        children: [
          Wallpaper().background(),
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
                    return Cards().pokemon(listPokemons[index]);
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

// Container(
// margin: EdgeInsets.all(8),
// decoration: BoxDecoration(
// color: Colors.lightGreen,
// borderRadius: BorderRadius.all(Radius.circular(4)),
// boxShadow: [
// BoxShadow(
// color: Colors.grey.withOpacity(0.5),
// spreadRadius: 5,
// blurRadius: 3,
// offset: Offset(1, 1), // changes position of shadow
// ),
// ],
// ),
// child: ListTile(
// title: Text(
// 'Bulbassaur',
// style: TextStyle(
// fontSize: 20,
// color: Colors.white,
// fontWeight: FontWeight.w400,
// ),
// ),
// subtitle: Row(
// children: [
// Container(
// margin: EdgeInsets.only(top: 8),
// padding: EdgeInsets.all(4),
// color: Colors.green,
// child: Row(
// children: [
// Icon(
// Icons.info,
// size: 16,
// color: Colors.grey.shade200,
// ),
// SizedBox(width: 4),
// Text(
// 'Grass',
// style: TextStyle(
// fontSize: 12,
// color: Colors.grey.shade200,
// ),
// ),
// ],
// ),
// ),
// ],
// ),
// trailing: Icon(Icons.android, size: 50),
// onTap: () {},
// ),
// ),
