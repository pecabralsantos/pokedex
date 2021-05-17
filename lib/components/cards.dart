import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/components/wallpaper.dart';
import 'package:pokedex/controller/service_controller.dart';
import 'package:pokedex/models/repository/favorite_repository.dart';
import 'package:pokedex/models/repository/pokemon_repository.dart';
import 'package:pokedex/screens/pokemon_detail.dart';

class Cards {
  info(BuildContext context, Pokemon pokemon) {
    final _serviceController = ServiceController();
    final fisrtType = pokemon.types.first.type.name;
    final lastType = pokemon.types.last.type.name;

    return Container(
      margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Wallpaper().backgroundCard(fisrtType),
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
              tag: pokemon.name,
              child: SvgPicture.network(
                pokemon.sprites.other.dreamWorld.frontDefault,
                width: 60,
                height: 60,
                fit: BoxFit.fill,
              ),
            ),
            title: Row(
              children: [
                Text(
                  '#' + pokemon.id.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(width: 16),
                Flexible(
                  child: Text(
                    pokemon.name,
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
                type(fisrtType, EdgeInsets.only(top: 12)),
                pokemon.types.last.slot == 2
                    ? type(lastType, EdgeInsets.fromLTRB(8, 12, 0, 0))
                    : Container(),
              ],
            ),
            trailing: pokemon.favorite == null || !pokemon.favorite
                ? IconButton(
                    icon: Icon(Icons.favorite_outline),
                    onPressed: () async {
                      await _serviceController.saveFavorite(
                        Favorite(namePokemon: pokemon.name),
                      );
                    },
                  )
                : IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    onPressed: () async {
                      await _serviceController.getListFavorites();
                      var favorite = _serviceController.listFavorite
                          .firstWhere((e) => e.namePokemon == pokemon.name);
                      await _serviceController.deleteFavorite(favorite);
                    },
                  ),
            onTap: () async {
              Navigator.push(context, MaterialPageRoute(
                builder: (_) {
                  return PokemonDetail(pokemon: pokemon);
                },
              ));
            },
          ),
        ],
      ),
    );
  }

  type(String type, [EdgeInsets edgeInsets]) {
    return Container(
      margin: edgeInsets,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Wallpaper().backgroundCard(type),
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
        type,
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey.shade50,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
