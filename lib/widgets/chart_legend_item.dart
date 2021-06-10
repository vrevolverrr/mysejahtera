import 'package:flutter/material.dart';

Widget chartLegendItem(Color color, String label) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(right: 6.0),
        width: 12.0,
        height: 12.0,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
      Container(
        margin: EdgeInsets.only(right: 25.0),
        height: 14.0,
        child: Text(label),
      ),
    ],
  );
}
