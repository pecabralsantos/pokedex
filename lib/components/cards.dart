import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobx/src/api/observable_collections.dart';
import 'package:pokedex/components/wallpaper.dart';
import 'package:pokedex/controller/dao_controller.dart';
import 'package:pokedex/controller/service_controller.dart';
import 'package:pokedex/models/favorite_model.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/screens/detail_pokemon.dart';

class Cards {
  pokemon(BuildContext context, PokemonDetails details) {
    final _serviceController = ServiceController();
    final _daoController = DaoController();
    final primatyType = details.types.first.type.name;
    final secondType = details.types.last.type.name;

    return Container(
      margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Wallpaper().backgroundCard(primatyType),
        borderRadius: BorderRadius.all(Radius.circular(4)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0.5, 0.5),
          ),
        ],
      ),
      child: Stack(
        children: [
          Image.asset(
            'images/ic_background_pokeball.png',
            color: Colors.white24,
            width: 90,
            height: 70,
            fit: BoxFit.fitWidth,
          ),
          ListTile(
            leading: Hero(
              tag: details.name,
              child: SvgPicture.network(
                details.sprites.other.dreamWorld.frontDefault,
                width: 60,
                height: 60,
                fit: BoxFit.fill,
              ),
            ),
            title: Row(
              children: [
                Text(
                  '#' + details.id.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(width: 16),
                Flexible(
                  child: Text(
                    details.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
            subtitle: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 12),
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Wallpaper().backgroundCard(primatyType),
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: Text(
                    primatyType,
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
                          color: Wallpaper().backgroundCard(secondType),
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black45.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        child: Text(
                          secondType,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade200,
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
            trailing: details.favorite == null || !details.favorite
                ? Observer(
                    builder: (_) {
                      return IconButton(
                        icon: Icon(Icons.favorite_outline),
                        onPressed: () {
                          _daoController.saveFavorite(
                            Favorite(namePokemon: details.name),
                          );
                          _serviceController.getQueryPokemon();
                        },
                      );
                    },
                  )
                : Observer(
                    builder: (_) {
                      return IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        onPressed: () async {
                          await _daoController.getListFavorites();
                          var favorite = _daoController.listFavorite
                              .firstWhere((e) => e.namePokemon == details.name);
                          _daoController.deleteFavorite(favorite);
                          await _serviceController.getQueryPokemon();
                        },
                      );
                    },
                  ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (_) {
                  return DetailPokemon(details: details);
                },
              ));
            },
          ),
        ],
      ),
    );
  }
}
