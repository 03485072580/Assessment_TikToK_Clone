import 'package:flutter/material.dart';

//Regular Text Styles
regularWhiteText8(color) => TextStyle(
      fontSize: 8,
      color: color,
      fontWeight: FontWeight.normal,
    );

regularWhiteText10(color) => TextStyle(
      fontSize: 10,
      color: color,
      fontWeight: FontWeight.normal,
    );

regularWhiteText12(color, {overflow, decoration,fontStyle}) => TextStyle(
    fontSize: 12,
    color: color,
    fontStyle: fontStyle,
    fontWeight: FontWeight.normal,
    overflow: overflow,
    decoration: decoration);

regularWhiteText14(
  color, {
  decoration,
  fontStyle = FontStyle.normal,
  lineSpacing,
  shadows,
  decorationColor,
}) =>
    TextStyle(
        fontSize: 14,
        color: color,
        shadows: shadows,
        decorationColor: decorationColor,
        fontWeight: FontWeight.normal,
        fontStyle: fontStyle,
        height: lineSpacing,
        decoration: decoration);

regularWhiteTextWithDecoration14(color) => TextStyle(
      decoration: TextDecoration.underline,
      fontSize: 14,
      color: color,
      fontWeight: FontWeight.normal,
    );

regularWhiteText16(color, {decoration}) => TextStyle(
    fontSize: 16,
    color: color,
    fontWeight: FontWeight.normal,
    decoration: decoration);

regularWhiteText18(color, {decoration}) => TextStyle(
    fontSize: 18,
    color: color,
    fontWeight: FontWeight.normal,
    decoration: decoration);

regularWhiteText22(color, {decoration}) => TextStyle(
    fontSize: 22,
    color: color,
    fontWeight: FontWeight.normal,
    decoration: decoration);

regularWhiteText24(color, {decoration}) => TextStyle(
    fontSize: 24,
    color: color,
    fontWeight: FontWeight.normal,
    decoration: decoration);

//Bold Text Styles
boldWhiteText8(color) => TextStyle(
      fontSize: 8,
      color: color,
      fontWeight: FontWeight.bold,
    );

boldWhiteText10(color) => TextStyle(
      fontSize: 10,
      color: color,
      fontWeight: FontWeight.bold,
    );

boldWhiteText12(color,{fontStyle}) => TextStyle(
      fontSize: 12,
      color: color,
      fontStyle: fontStyle,
      fontWeight: FontWeight.bold,
    );

boldWhiteText14(color,
        {decoration, fontStyle = FontStyle.normal, lineSpacing}) =>
    TextStyle(
        fontSize: 14,
        color: color,
        fontStyle: fontStyle,
        fontWeight: FontWeight.bold,
        height: lineSpacing,
        decoration: decoration);

boldWhiteText16(color) => TextStyle(
      fontSize: 16,
      color: color,
      fontWeight: FontWeight.bold,
    );

boldWhiteText18(color, {height}) => TextStyle(
      fontSize: 18,
      color: color,
      height: height,
      fontWeight: FontWeight.bold,
    );

boldWhiteText32(color, {lineSpacing}) => TextStyle(
    fontSize: 32,
    // default is 0.0
    color: color,
    fontWeight: FontWeight.bold,
    height: lineSpacing);

boldWhiteText42(color, {lineSpacing}) => TextStyle(
    fontSize: 42,
    // default is 0.0
    color: color,
    fontWeight: FontWeight.bold,
    height: lineSpacing);

boldWhiteText28(color) => TextStyle(
      fontSize: 32, // default is 0.0
      color: color,
      fontWeight: FontWeight.bold,
    );

boldWhiteText24(color, {height}) => TextStyle(
      fontSize: 24,
      color: color,
      height: height,
      fontWeight: FontWeight.bold,
    );

boldWhiteText20(color, {height}) => TextStyle(
      fontSize: 20,
      color: color,
      height: height,
      fontWeight: FontWeight.bold,
    );
