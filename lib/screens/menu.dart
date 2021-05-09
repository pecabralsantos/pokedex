import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  final int userLoggedId;

  Menu({Key key, @required this.userLoggedId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('MENU'),
      ),
    );
  }
}
