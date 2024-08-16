import 'package:flutter/material.dart';

Widget buttonWithIcon(
  double wscreen, {
  required Function ontap,
  IconData icon = Icons.arrow_outward,
  text = "Ir para o inicio",
  Color color = const Color(0xff53B175),
}) {
  return Center(
    child: InkWell(
      onTap: () async => await ontap(),
      child: Container(
        height: 60,
        width: wscreen,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05), // Cor da sombra
              blurRadius: 5, // Desfocamento
              offset: const Offset(0, 5), // Deslocamento horizontal e vertical
            ),
          ],
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                  color: Colors.white, fontSize: wscreen > 700 ? 18 : 15),
            ),
            const SizedBox(width: 15),
            Icon(
              icon,
              color: Colors.white,
            ),
          ],
        ),
      ),
    ),
  );
}
