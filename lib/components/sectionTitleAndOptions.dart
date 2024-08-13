import 'package:flutter/material.dart';

Widget sectionTitleAndSection(wscreen,
    {text = "Exclusive Offer", fontSize = 24}) {
  return SizedBox(
      width: wscreen,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        // =========================
        //        Tittle
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
          ),
        ),
        // // =========================
        // //        button
        // TextButton(
        //     onPressed: () {
        //       context.read<ProductsProvider>().handleViewProduct();
        //     },
        //     child: const Text(
        //       "See all",
        //       style: TextStyle(
        //           fontSize: 16,
        //           fontWeight: FontWeight.w600,
        //           color: Color(0xff53B175)),
        //     ))
      ]));
}
