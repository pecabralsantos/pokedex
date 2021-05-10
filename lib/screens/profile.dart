import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key key, int userLoggedId}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('PERFIL')),
    );
  }
}
