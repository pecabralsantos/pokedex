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
          seconds: 3,
          loaderColor: Colors.transparent,
          navigateAfterSeconds: Dashboard(),
        ),
        Container(
          child: Image.asset(
            'images/splash_pokeball.gif',
            width: double.maxFinite,
            height: double.maxFinite,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
