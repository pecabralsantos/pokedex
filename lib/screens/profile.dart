import 'package:flutter/material.dart';
import 'package:pokedex/components/toolbar.dart';
import 'package:pokedex/components/wallpaper.dart';

class Profile extends StatefulWidget {
  final int userLoggedId;

  Profile({Key key, @required this.userLoggedId}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState(this.userLoggedId);
}

class _ProfileState extends State<Profile> {
  final int userLoggedId;

  _ProfileState(this.userLoggedId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(28, 33, 74, 0.8),
        centerTitle: true,
        title: Hero(
          tag: 3,
          child: Image.asset(
            'images/ic_pokeball.png',
            width: 35,
          ),
        ),
      ),
      body: Stack(
        children: [
          Wallpaper().backgroundPage(),
          Center(
            child: Text('PERFIL'),
          ),
        ],
      ),
    );
  }
}
