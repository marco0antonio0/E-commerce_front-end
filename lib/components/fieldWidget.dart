import 'package:flutter/material.dart';

Widget fieldWidget(
  double wscreen, {
  bool isPassword = false,
  String hintText = "Search Store",
  IconData icon = Icons.search,
  required TextEditingController controller,
  bool hasError = false,
  String errorMessage = "",
}) {
  return Container(
    width: wscreen,
    child: TextField(
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        enabled: true,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 20, right: 10),
          child: Icon(
            icon,
            size: 30,
          ),
        ),
        hintText: hintText,
        fillColor: const Color(0xff7C7C7C),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: hasError ? Colors.red : Colors.black.withOpacity(.5),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: hasError ? Colors.red : Colors.blue,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        errorText: hasError
            ? errorMessage
            : null, // Exibe a mensagem de erro se hasError for true
      ),
    ),
  );
}
