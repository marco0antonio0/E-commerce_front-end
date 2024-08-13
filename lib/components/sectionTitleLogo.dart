import 'package:flutter/material.dart';

Widget sectionTitleLogo({text = '@MarketPlace', fontSize = 23}) {
  return Text(
    text,
    style: TextStyle(
        fontSize: fontSize,
        color: const Color(0xff4C4F4D),
        fontWeight: FontWeight.w500),
    textAlign: TextAlign.center,
  );
}
