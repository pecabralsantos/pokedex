import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/components/detail_options.dart';
import 'package:pokedex/components/wallpaper.dart';
import 'package:pokedex/controller/dao_controller.dart';
import 'package:pokedex/controller/service_controller.dart';
import 'package:pokedex/models/favorite_model.dart';
import 'package:pokedex/models/pokemon_model.dart';

class PokemonDetail extends StatefulWidget {
  final Pokemon pokemon;

  PokemonDetail({Key key, @required this.pokemon}) : super(key: key);

  @override
  _PokemonDetailState createState() => _PokemonDetailState(this.pokemon);
}

class _PokemonDetailState extends State<PokemonDetail> {
  final Pokemon pokemon;
  final _daoController = DaoController();
  final _serviceController = ServiceController();

  _PokemonDetailState(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Wallpaper().backgroundCard(pokemon.types.first.type.name),
        padding: EdgeInsets.only(top: 32),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  pokemon.favorite == null || !pokemon.favorite
                      ? Observer(
                          builder: (_) {
                            return IconButton(
                              icon: Icon(
                                Icons.favorite_outline,
                                color: Colors.white,
                              ),
                              onPressed: () async {
                                await _daoController.saveFavorite(
                                  Favorite(namePokemon: pokemon.name),
                                );
                                await _serviceController.getApiPokemon();
                              },
                            );
                          },
                        )
                      : Observer(
                          builder: (_) {
                            return IconButton(
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.white,
                              ),
                              onPressed: () async {
                                await _daoController.getListFavorites();
                                var favorite = _daoController.listFavorite
                                    .firstWhere(
                                        (e) => e.namePokemon == pokemon.name);
                                await _daoController.deleteFavorite(favorite);
                                await _serviceController.getApiPokemon();
                              },
                            );
                          },
                        ),
                ],
              ),
            ),
            Container(
              alignment: AlignmentDirectional.center,
              child: Hero(
                tag: pokemon.name,
                child: SvgPicture.network(
                  pokemon.sprites.other.dreamWorld.frontDefault,
                  width: 150,
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(top: 24),
                padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        height: 60,
                        child: Text(
                          pokemon.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Wallpaper()
                                .backgroundCard(pokemon.types.first.type.name),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: Text(
                          'Dados base',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Wallpaper()
                                .backgroundCard(pokemon.types.first.type.name),
                          ),
                        ),
                      ),
                      DetailOptions().attributes(
                          'Ordem pokemon', pokemon.order.toString()),
                      DetailOptions().attributes('Experiência base',
                          pokemon.baseExperience.toString()),
                      DetailOptions()
                          .attributes('Altura', pokemon.height.toString()),
                      DetailOptions()
                          .attributes('Peso', pokemon.weight.toString()),
                      DetailOptions().attributes(
                          'Tipo',
                          pokemon.types.first.type.name,
                          pokemon.types.last.type.name),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
