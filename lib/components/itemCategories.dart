import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

Widget itemCategories({title = "Organic bananas", Color color = Colors.white}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.black.withOpacity(0.15)),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05), // Cor da sombra
              blurRadius: 5, // Desfocamento
              offset: const Offset(0, 5), // Deslocamento horizontal e vertical
            ),
          ],
        ),
        child: Center(
          child: AutoSizeText(
            title,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black.withOpacity(.8)),
            maxLines: 1,
            minFontSize: 12,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
    },
  );
}
