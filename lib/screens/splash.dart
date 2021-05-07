import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pokedex/screens/dashboard.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SplashScreen(
          seconds: 5,
          loaderColor: Colors.transparent,
          navigateAfterSeconds: Dashboard(),
        ),
        Container(
          child: Image.asset(
            'images/pokeball_splash.gif',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
