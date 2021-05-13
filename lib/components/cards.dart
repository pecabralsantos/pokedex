import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/models/pokemon_model.dart';

class Cards {
  pokemon(PokemonDetails details) {
    final primatyType = details.types.first.type.name;
    final secondType = details.types.last.type.name;

    return Container(
      margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: backgroundCard(primatyType),
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
              decoration: BoxDecoration(
                color: backgroundCard(primatyType),
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
                    margin: EdgeInsets.fromLTRB(8, 8, 0, 0),
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: backgroundCard(secondType),
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
        onTap: () {},
      ),
    );
  }

  backgroundCard(String type) {
    switch (type) {
      case 'normal':
        return Color.fromRGBO(168, 167, 122, 1);
        break;
      case 'fighting':
        return Color.fromRGBO(194, 46, 40, 1);
        break;
      case 'flying':
        return Color.fromRGBO(169, 143, 243, 1);
        break;
      case 'poison':
        return Color.fromRGBO(163, 62, 161, 1);
        break;
      case 'ground':
        return Color.fromRGBO(226, 191, 101, 1);
        break;
      case 'rock':
        return Color.fromRGBO(182, 161, 54, 1);
        break;
      case 'bug':
        return Color.fromRGBO(166, 185, 26, 1);
        break;
      case 'ghost':
        return Color.fromRGBO(115, 87, 151, 1);
        break;
      case 'steel':
        return Color.fromRGBO(183, 183, 206, 1);
        break;
      case 'fire':
        return Color.fromRGBO(238, 129, 48, 1);
        break;
      case 'water':
        return Color.fromRGBO(99, 144, 240, 1);
        break;
      case 'grass':
        return Color.fromRGBO(122, 199, 76, 1);
        break;
      case 'electric':
        return Color.fromRGBO(247, 208, 44, 1);
        break;
      case 'ice':
        return Color.fromRGBO(150, 217, 214, 1);
        break;
      case 'dragon':
        return Color.fromRGBO(111, 53, 252, 1);
        break;
      case 'dark':
        return Color.fromRGBO(112, 87, 70, 1);
        break;
      case 'fairy':
        return Color.fromRGBO(214, 133, 173, 1);
        break;
      default:
        return Colors.grey;
        break;
    }
  }
}
