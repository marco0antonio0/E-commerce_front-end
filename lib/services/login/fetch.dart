import 'dart:convert';
import 'package:dirrocha_ecommerce/services/cokiees/setCokiees.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

Future<bool> loginUser(
    {required String email,
    required String password,
    required BuildContext context}) async {
  // Configurando o corpo da requisição como application/x-www-form-urlencoded
  final body = {
    'email': email,
    'password': password,
  };

  final response = await http.post(
    Uri.parse('https://e-commerce-api.dirrocha.com/user/login'),
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: body,
  );

  if (response.statusCode == 200) {
    // Decodificar a resposta JSON
    Map<String, dynamic> jsonResponse = json.decode(response.body);

    // Verificar se o token JWT está presente na resposta
    if (jsonResponse.containsKey('token')) {
      String token = jsonResponse['token'];

      // Armazenar o token no "cookie" (armazenamento seguro ou cookies)
      await storeJwtToken(token);

      // Navegar para a página principal
      context.go('/');
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
}
