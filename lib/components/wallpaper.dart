import 'package:flutter/material.dart';

class Wallpaper {
  background() {
    return Container(
      child: Image.asset(
        'images/app_background.jpg',
        width: double.maxFinite,
        height: double.maxFinite,
        fit: BoxFit.fill,
      ),
    );
  }
}
