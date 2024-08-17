import 'package:dirrocha_ecommerce/CustomMessages/MessagExceptions.dart';
import 'package:dirrocha_ecommerce/services/login/fetch.dart';
import 'package:flutter/material.dart';

Future valideFieldUserLogin(
    {required String email,
    required String password,
    required BuildContext context}) async {
  if (email.isNotEmpty && password.isNotEmpty) {
    bool response =
        await loginUser(email: email, password: password, context: context);
    if (!response) {
      ScaffoldMessenger.of(context).showSnackBar(snackBarFailIsIcorret);
      return [response, email.isNotEmpty, password.isNotEmpty];
    }
    ScaffoldMessenger.of(context).showSnackBar(snackBarSucess);
    return [response, email.isNotEmpty, password.isNotEmpty];
  } else {
    ScaffoldMessenger.of(context).showSnackBar(snackBarFailIsEmpty);
    return [false, email.isNotEmpty, password.isNotEmpty];
  }
}
