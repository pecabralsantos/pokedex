import 'package:flutter/material.dart';

class DetailOptions {
  attributes(String attribute, String description1, [String description2]) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 160,
          height: 24,
          child: Text(
            attribute,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        attribute == 'Ordem pokemon'
            ? Text('#' + description1)
            : Text(description1),
        description2 != null && description2 != description1
            ? Row(
                children: [
                  Text(" | ", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(description2),
                ],
              )
            : Container(),
      ],
    );
  }
}
