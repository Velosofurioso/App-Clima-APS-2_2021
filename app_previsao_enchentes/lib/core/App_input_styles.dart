
import 'package:flutter/material.dart';

class AppInputStyles {

  static InputDecoration textFieldStyle({String labelTextStr="",String hintTextStr=""}) {
    return InputDecoration(
    contentPadding: EdgeInsets.all(15),
    labelText: labelTextStr,
    hintText:hintTextStr,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
    ));
  }


}