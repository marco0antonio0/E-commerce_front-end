import 'dart:convert';
import 'package:dirrocha_ecommerce/CustomMessages/MessagExceptions.dart';
import 'package:dirrocha_ecommerce/services/cokiees/setCokiees.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

Future<bool> registerUser(
    {required String email,
    required String nome,
    required String password,
    required BuildContext context}) async {
  // Configurando o corpo da requisição como application/x-www-form-urlencoded
  final body = {
    'email': email,
    'name': nome,
    'password': password,
  };

  final response = await http.post(
    Uri.parse('https://e-commerce-api.dirrocha.com/user/register'),
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: body,
  );

  if (response.statusCode == 201) {
    // Decodificar a resposta JSON
    Map<String, dynamic> jsonResponse = json.decode(response.body);

    // Verificar se o token JWT está presente na resposta
    if (jsonResponse.containsKey('token')) {
      String token = jsonResponse['token'];

      // Armazenar o token no "cookie" (armazenamento seguro ou cookies)
      await storeJwtToken(token);
      ScaffoldMessenger.of(context).showSnackBar(snackBarSucessCreateAccount);
      // Navegar para a página principal
      // ignore: use_build_context_synchronously
      context.go('/');
      return true;
    } else {
      return false;
    }
  } else {
    if (response.statusCode == 409) {
      ScaffoldMessenger.of(context).showSnackBar(snackBarConflictEmail);
    } else {
      if (response.statusCode == 400) {
        ScaffoldMessenger.of(context).showSnackBar(snackBardFieldEmailIsEmpty);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(snackBarAddError);
      }
    }
    return false;
  }
}
