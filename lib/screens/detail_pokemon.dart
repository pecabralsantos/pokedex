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
              alignment: AlignmentDirectional.center,
              child: Hero(
                tag: details.name,
                child: SvgPicture.network(
                  details.sprites.other.dreamWorld.frontDefault,
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
                          details.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Wallpaper()
                                .backgroundCard(details.types.first.type.name),
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
                                .backgroundCard(details.types.first.type.name),
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 160,
                            height: 24,
                            child: Text(
                              'Ordem pokemon',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text('#' + details.order.toString()),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 160,
                            height: 24,
                            child: Text(
                              'Experiência base',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(details.baseExperience.toString()),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 160,
                            height: 24,
                            child: Text(
                              'Altura',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(details.height.toString()),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 160,
                            height: 24,
                            child: Text(
                              'Peso',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(details.weight.toString()),
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
