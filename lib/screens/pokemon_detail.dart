import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/components/detail_options.dart';
import 'package:pokedex/components/wallpaper.dart';
import 'package:pokedex/controller/dao_controller.dart';
import 'package:pokedex/controller/service_controller.dart';
import 'package:pokedex/models/repository/favorite_repository.dart';
import 'package:pokedex/models/repository/pokemon_repository.dart';

class PokemonDetail extends StatefulWidget {
  final Pokemon pokemon;

  PokemonDetail({
    Key key,
    @required this.pokemon,
  }) : super(key: key);

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
    final fisrtType = pokemon.types.first.type.name;
    final lastType = pokemon.types.last.type.name;

    return Scaffold(
      body: Container(
        color: Wallpaper().backgroundCard(fisrtType),
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
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Wallpaper().backgroundCard(fisrtType),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Text(
                          'Informações básicas',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Wallpaper().backgroundCard(fisrtType),
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
                          'Tipo', fisrtType, lastType, pokemon.types),
                      Padding(
                        padding: EdgeInsets.only(top: 18),
                        child: Text(
                          'Habilidades',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Wallpaper().backgroundCard(fisrtType),
                          ),
                        ),
                      ),
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: pokemon.abilities.length,
                        itemBuilder: (_, index) {
                          var abilities = pokemon.abilities[index];
                          return Column(
                            children: [
                              DetailOptions().ability(abilities, fisrtType),
                            ],
                          );
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 18),
                        child: Text(
                          'Estatísticas',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Wallpaper().backgroundCard(fisrtType),
                          ),
                        ),
                      ),
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: pokemon.stats.length,
                        itemBuilder: (_, index) {
                          var stats = pokemon.stats[index];
                          return Column(
                            children: [
                              DetailOptions().attributes(
                                  stats.stat.name, stats.baseStat.toString()),
                            ],
                          );
                        },
                      ),
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
