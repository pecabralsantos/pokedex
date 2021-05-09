import 'package:flutter/material.dart';

class User {
  int id;
  final String name;
  final String email;
  final int phone;
  final String password;

  User({
    @required this.name,
    @required this.email,
    @required this.phone,
    @required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      password: map['password'],
    );
  }
}
