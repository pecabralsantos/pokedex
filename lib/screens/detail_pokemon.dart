import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/components/wallpaper.dart';
import 'package:pokedex/models/pokemon_model.dart';

class DetailPokemon extends StatefulWidget {
  final PokemonDetails details;

  DetailPokemon({Key key, @required this.details}) : super(key: key);

  @override
  _DetailPokemonState createState() => _DetailPokemonState(this.details);
}

class _DetailPokemonState extends State<DetailPokemon> {
  final PokemonDetails details;

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
                              onPressed: () {},
                            );
                          },
                        )
                      : Observer(
                          builder: (_) {
                            return IconButton(
                              icon: Icon(Icons.favorite),
                              onPressed: () {},
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
                    tag: 'pokemon',
                    child: SvgPicture.network(
                      details.sprites.other.dreamWorld.frontDefault,
                      width: 90,
                    ),
                  ),
                  SizedBox(width: 24),
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
                                color: Colors.grey.shade200,
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
                                      color: Colors.grey.shade200,
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
                padding: EdgeInsets.fromLTRB(8, 40, 9, 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [],
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
