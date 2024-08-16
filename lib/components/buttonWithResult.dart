import 'package:flutter/material.dart';

Widget buttonWithResult(
  double wscreen, {
  required Function ontap,
  text = "finaliza compra",
  result = "5.99",
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
            const Spacer(flex: 100),
            Align(
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(
                    color: Colors.white, fontSize: wscreen > 700 ? 18 : 15),
              ),
            ),
            const Spacer(flex: 50),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.1),
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  "R\$: $result",
                  style: TextStyle(
                      color: Colors.white, fontSize: wscreen > 700 ? 16 : 14),
                ),
              ),
            ),
            const Spacer(flex: 30),
          ],
        ),
      ),
    ),
  );
}
