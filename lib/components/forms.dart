import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Forms {
  textFormField({
    TextEditingController controller,
    TextInputType keyboardType,
    bool obscureText = false,
    String labelText,
    onChanged,
  }) {
    return Container(
      width: 175,
      color: Colors.blueGrey.shade100,
      child: Theme(
        data: ThemeData(
          primaryColor: Colors.blueGrey.shade900,
        ),
        child: TextFormField(

          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: labelText,
          ),
          obscureText: obscureText,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
