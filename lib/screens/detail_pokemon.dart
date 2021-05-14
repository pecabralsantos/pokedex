import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/components/wallpaper.dart';
import 'package:pokedex/controller/dao_controller.dart';
import 'package:pokedex/controller/service_controller.dart';
import 'package:pokedex/models/favorite_model.dart';
import 'package:pokedex/models/pokemon_model.dart';

class DetailPokemon extends StatefulWidget {
  final PokemonDetails details;

  DetailPokemon({Key key, @required this.details}) : super(key: key);

  @override
  _DetailPokemonState createState() => _DetailPokemonState(this.details);
}

class _DetailPokemonState extends State<DetailPokemon> {
  final PokemonDetails details;
  final _daoController = DaoController();
  final _serviceController = ServiceController();

  _DetailPokemonState(this.details);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Wallpaper().backgroundCard(details.types.first.type.name),
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
                  details.favorite == null || !details.favorite
                      ? Observer(
                          builder: (_) {
                            return IconButton(
                              icon: Icon(
                                Icons.favorite_outline,
                                color: Colors.white,
                              ),
                              onPressed: () async {
                                await _daoController.saveFavorite(
                                  Favorite(namePokemon: details.name),
                                );
                                await _serviceController.getQueryPokemon();
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
                                        (e) => e.namePokemon == details.name);
                                await _daoController.deleteFavorite(favorite);
                                await _serviceController.getQueryPokemon();
                              },
                            );
                          },
                        ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: details.name,
                    child: SvgPicture.network(
                      details.sprites.other.dreamWorld.frontDefault,
                      width: 100,
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '#' + details.id.toString(),
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            details.name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 12),
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Wallpaper().backgroundCard(
                                  details.types.first.type.name),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black45.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            child: Text(
                              details.types.first.type.name,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          details.types.last.slot == 2
                              ? Container(
                                  margin: EdgeInsets.fromLTRB(8, 12, 0, 0),
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Wallpaper().backgroundCard(
                                        details.types.last.type.name),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black45.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    details.types.last.type.name,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade50,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(top: 48),
                padding: EdgeInsets.fromLTRB(16, 40, 16, 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text(
                          'Estatística base',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Wallpaper()
                                .backgroundCard(details.types.first.type.name),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Ordem pokemon',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 24),
                          Text(details.order.toString()),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Altura',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 24),
                          Text(details.height.toString()),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Peso',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 24),
                          Text(details.weight.toString()),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Experiência base',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 24),
                          Text(details.baseExperience.toString()),
                        ],
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
