import 'package:flutter/material.dart';

Widget logo() {
  return LayoutBuilder(builder: (context, constraints) {
    return Container(
      height: constraints.maxWidth > 500 ? 100 : 70,
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("images/logo.png"))),
    );
  });
}
