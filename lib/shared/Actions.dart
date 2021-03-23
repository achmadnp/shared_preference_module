import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionWidgets {
  static List<Widget> homeActions = [
    IconButton(
      icon: Icon(Icons.wb_sunny_outlined),
      color: Colors.white,
      onPressed: () {
        print('object');
      },
    ),
  ];
}
