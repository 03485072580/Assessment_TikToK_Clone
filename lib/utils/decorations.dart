import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

appSeparationLineDecoration(color) {
  return BoxDecoration(
    shape: BoxShape.rectangle,
    color: color,
  );
}

rectangularWhiteBoxDecorationWithRadiusElevation(
    double radius, double elevation) =>
    BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(radius),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: elevation,
          ),
        ]);

rectangularCustomColorBoxDecorationWithRadius(
    double topLeft,
    double bottomLeft,
    double bottomRight,
    double topRight,
    Color color,
    ) =>
    BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeft),
            bottomLeft: Radius.circular(bottomLeft),
            bottomRight: Radius.circular(bottomRight),
            topRight: Radius.circular(topRight)),
        color: color);