import 'package:flutter/material.dart';

class Dialogs {
  errorLogin(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text('Ops...'),
          content: Text(
              'Usuário ou senha não conferem! Por favor, tente novamente.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.pop(context),
            )
          ],
        );
      },
    );
  }
}
