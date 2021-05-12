import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/models/pokemon_model.dart';

class Cards {
  pokemon(PokemonDetails details) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.lightGreen,
        borderRadius: BorderRadius.all(Radius.circular(4)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0.5, 0.5), // changes position of shadow
          ),
        ],
      ),
      child: ListTile(
        leading: SvgPicture.network(
          details.sprites.other.dreamWorld.frontDefault,
          width: 60,
          height: 60,
        ),
        title: Text(
          details.name,
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        subtitle: Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: 8),
              padding: EdgeInsets.all(4),
              color: Colors.green,
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
                    margin: EdgeInsets.fromLTRB(4, 8, 0, 0),
                    padding: EdgeInsets.all(4),
                    color: Colors.green,
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
        trailing: Icon(Icons.favorite_outline),
        onTap: () {},
      ),
    );
  }
}
