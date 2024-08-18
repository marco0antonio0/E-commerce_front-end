import 'package:dirrocha_ecommerce/services/cokiees/getCokiees.dart';
import 'package:dirrocha_ecommerce/services/validToken/fetch.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

Future<bool> fetchFinalizeCartItem(BuildContext context, var un) async {
  var jwt = await getJwtToken();
  if (jwt == null) {
    return false;
  }
  bool check = await fetchIsValidToken(jwt);
  if (!check) {
    return false;
  }
  final response = await http.post(
    Uri.parse('https://e-commerce-api.dirrocha.com/cart/finalize'),
    headers: {
      'Authorization': 'Bearer $jwt',
    },
  );

  if (response.statusCode == 201) {
    if (un > 0) {
      context.go('/cart/sucess');
    }
    return true;
  } else {
    return false;
  }
}
