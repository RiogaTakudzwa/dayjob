import 'package:flutter/material.dart';
import '../../../common/constraints/colour_scheme.dart';
import '../../../main.dart';

class AppSnackBar {
  static showSnackBar(String? text){
    if(text == null) return;

    final snackBar = SnackBar(
      content: Text(
        text,
        style: const TextStyle(
          color: Colors.white
        ),
      ),
      backgroundColor : ColourScheme.snackBarBackgroundColour,
    );

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}