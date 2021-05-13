import 'package:flutter/material.dart';

class Toolbar {
  appBar() {
    return AppBar(
      backgroundColor: Color.fromRGBO(28, 33, 74, 0.8),
      centerTitle: true,
      title: Image.asset(
        'images/ic_pokeball.png',
        width: 35,
      ),
    );
  }
}
