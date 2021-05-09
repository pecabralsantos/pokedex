import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromRGBO(28, 33, 74, 1)),
        backgroundColor: Color.fromRGBO(136, 196, 177, 1),
        title: Text('Login',
            style: TextStyle(color: Color.fromRGBO(28, 33, 74, 1))),
      ),
      body: Stack(
        children: [
          Container(
            child: Image.asset(
              'images/dashboard_background.jpg',
              width: double.maxFinite,
              height: double.maxFinite,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            alignment: AlignmentDirectional.bottomCenter,
            child: Hero(
              tag: 'logo',
              child: Image.asset(
                'images/pokedex_logo.png',
                width: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
