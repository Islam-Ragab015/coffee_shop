import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: FontConstants.fontFamily,
    color: color,
    fontWeight: fontWeight,
  );
}

TextStyle _getTextStyleDecoration(
    double fontSize, FontWeight fontWeight,TextDecoration? decoration, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: FontConstants.fontFamily,
    fontWeight: fontWeight,
    color: color,
    decoration: decoration,
  );
}

// TextStyle _getTextStyleItalic(double fontSize, FontWeight fontWeight,Color color) {
//   return TextStyle(
//       fontSize: fontSize,
//       fontFamily: FontConstants.fontFamily,
//       fontWeight: fontWeight,
//       color: color,
//       fontStyle: FontStyle.italic,);
// }
// regular style

TextStyle getRegularStyle(
    {double fontSize = FontSize.s15, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

// TextStyle getSemiBoldStyleTheme({double fontSize = FontSize.s22}) {
//   return _getTextStyleTheme(fontSize, FontWeightManager.semiBold);
// }

// medium style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s15, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

TextStyle getMediumStyle2(
    {double fontSize = FontSize.s15, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

// medium style

TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}

// bold style

TextStyle getBoldStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}

// semibold style

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s24, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}

TextStyle getSemiBoldStyleDecoration(
    {double fontSize = FontSize.s24, required Color color,required decoration}) {
  return _getTextStyleDecoration(fontSize, FontWeightManager.semiBold,decoration,color);
}

// Italic style
// TextStyle getItalicStyle({
//   double fontSize = FontSize.s20,required Color color,
// }) {
//   return _getTextStyleItalic(fontSize, FontWeightManager.regular,color);
// }
// TextStyle getLightItalicStyle({
//   double fontSize = FontSize.s20,required Color color,
// }) {
//   return _getTextStyleItalic(fontSize, FontWeightManager.light,color);
// }
