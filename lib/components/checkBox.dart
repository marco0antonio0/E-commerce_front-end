import 'package:flutter/material.dart';

Widget checkBox(
  double wscreen, {
  required Function(bool?) ontap,
  bool isChecked = false,
  String text = "Ir para o início",
}) {
  return Center(
    child: InkWell(
      onTap: () async =>
          await ontap(!isChecked), // Alterna o estado do checkbox ao clicar
      child: Container(
        height: 60,
        width: wscreen,
        decoration: const BoxDecoration(
          color: Colors.transparent,
          border: Border(top: BorderSide(color: Color(0xffE2E2E2), width: 1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              value: isChecked,
              onChanged: ontap,
              activeColor: const Color(0xff181725),
            ),
            const SizedBox(width: 15),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: const Color(0xff181725),
                fontSize: wscreen > 700 ? 18 : 15,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget checkBoxNull(double wscreen) {
  return Center(
    child: Container(
      height: 60,
      width: wscreen,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border(
            top: BorderSide(color: Colors.black.withOpacity(.1), width: 1)),
      ),
    ),
  );
}
