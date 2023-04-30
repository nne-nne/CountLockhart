import 'package:flutter/material.dart';
import 'package:hrabia_lockhart/fonts.dart';

class FancyText extends StatelessWidget {
  final String text;
  final double fontSize;
  const FancyText(
    this.text, {
    super.key,
    this.fontSize = 32,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: Fonts.fancyFont, color: Colors.white, fontSize: fontSize),
    );
  }
}
