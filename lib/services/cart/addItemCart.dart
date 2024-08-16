import 'package:dirrocha_ecommerce/CustomMessages/MessagExceptions.dart';
import 'package:dirrocha_ecommerce/services/cokiees/getCokiees.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<bool> fetchAddCartItem(context,
    {required String productId,
    required String provider,
    String productName = '',
    String price = '',
    popup = false}) async {
  var body = {};
  if (productName.isNotEmpty && price.isNotEmpty) {
    body = {
      'name': productName,
      'price': price,
      'productId': productId,
      'provider': provider,
      'quantity': ("1").toString(),
    };
  } else {
    body = {
      'productId': productId,
      'provider': provider,
      'quantity': ("1").toString(),
    };
  }

  var jwt = await getJwtToken();
  if (jwt == null) {
    return false;
  }

  final response = await http.post(
    Uri.parse('https://e-commerce-api.dirrocha.com/cart'),
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $jwt',
    },
    body: body.map((key, value) => MapEntry(key,
        value.toString())), // Certifique-se de que todos os valores são strings
  );
  if (response.statusCode == 201) {
    if (popup) {
      ScaffoldMessenger.of(context).showSnackBar(snackBarAddSucess);
    }
    return true;
  } else {
    if (popup) {
      ScaffoldMessenger.of(context).showSnackBar(snackBarAddError);
    }
    return false;
  }
}
