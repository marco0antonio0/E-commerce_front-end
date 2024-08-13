import 'package:flutter/material.dart';

Widget sectionPriceProduct({price = '4.99'}) {
  return Align(
      alignment: Alignment.centerLeft,
      child: Text("\$$price",
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700)));
}
