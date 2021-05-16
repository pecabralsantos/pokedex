import 'package:flutter/material.dart';
import 'package:pokedex/components/cards.dart';
import 'package:pokedex/components/wallpaper.dart';
import 'package:pokedex/models/repository/pokemon_repository.dart';

class DetailOptions {
  attributes(String attribute, String description1,
      [String description2, List<Types> listTypes]) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 160,
          height: 28,
          child: Text(
            attribute,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        attribute == 'Ordem pokemon'
            ? Text('#' + description1, style: TextStyle(fontSize: 16))
            : description1 != listTypes?.first?.type?.name
                ? Text(description1, style: TextStyle(fontSize: 16))
                : Cards().type(description1, EdgeInsets.only(right: 8)),
        description2 == null ||
                description2 == description1 ||
                description2 != listTypes?.last?.type?.name
            ? Container()
            : Cards().type(description2),
      ],
    );
  }

  ability(Abilities abilities, String type) {
    return Container(
      width: double.maxFinite,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 160,
            height: 28,
            child: Text(
              abilities.slot.toString() + '.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(abilities.ability.name),
                Text(abilities.isHidden ? 'hidden' : '',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
