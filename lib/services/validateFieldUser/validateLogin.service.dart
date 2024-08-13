import 'package:dirrocha_ecommerce/services/login/fetch.dart';
import 'package:flutter/material.dart';

Future valideFieldUserLogin(
    {required String email,
    required String password,
    required BuildContext context}) async {
  if (email.isNotEmpty && password.isNotEmpty) {
    bool response = await loginUser(email, password, context);
    return [response, email.isNotEmpty, password.isNotEmpty];
  } else {
    return [false, email.isNotEmpty, password.isNotEmpty];
  }
}
