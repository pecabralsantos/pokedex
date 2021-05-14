import 'package:flutter/material.dart';

class Wallpaper {
  backgroundPage() {
    return Container(
      child: Image.asset(
        'images/app_background.jpg',
        width: double.maxFinite,
        height: double.maxFinite,
        fit: BoxFit.fill,
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
