import 'package:dirrocha_ecommerce/CustomMessages/MessagExceptions.dart';
import 'package:dirrocha_ecommerce/services/register/fetch.dart';
import 'package:flutter/material.dart';

Future valideFieldUserRegister(
    {required String email,
    required String nome,
    required String password,
    required BuildContext context}) async {
  if (email.isNotEmpty && nome.isNotEmpty && password.isNotEmpty) {
    bool response = await registerUser(email: email,password:  password,nome:  nome,context:  context);

    return [response, email.isNotEmpty, nome.isNotEmpty, password.isNotEmpty];
  } else {
    ScaffoldMessenger.of(context).showSnackBar(snackBarFailIsEmpty);
    return [false, email.isNotEmpty, nome.isNotEmpty, password.isNotEmpty];
  }
}
