import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pokedex/screens/login.dart';
import 'package:pokedex/screens/register.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            padding: EdgeInsets.only(top: 50),
            alignment: AlignmentDirectional.topCenter,
            child: Hero(
              tag: 'logo',
              child: Image.asset(
                'images/pokedex_logo.png',
                width: 250,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    child: Text(
                      'CADASTRO',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Register(),
                      ));
                    },
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Login(),
                      ));
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Color.fromRGBO(44, 45, 154, 1)