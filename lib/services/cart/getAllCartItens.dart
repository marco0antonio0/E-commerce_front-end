import 'dart:convert';
import 'package:dirrocha_ecommerce/services/cokiees/getCokiees.dart';
import 'package:http/http.dart' as http;

Future fetchAllCartItem() async {
  var jwt = await getJwtToken();
  if (jwt == null) {
    return [];
  }
  final response = await http
      .get(Uri.parse('https://e-commerce-api.dirrocha.com/cart'), headers: {
    'Authorization': 'Bearer $jwt',
  });

  if (response.statusCode == 200) {
    // Decodificar a resposta JSON
    List<dynamic> jsonResponse = json.decode(response.body);

    // Converter cada item da lista em Map<String, dynamic>
    List<Map<String, dynamic>> items =
        jsonResponse.map((item) => item as Map<String, dynamic>).toList();

    return items;
  } else {
    return [];
  }
}

Future fetchAllCartItemHasBuy() async {
  var jwt = await getJwtToken();
  if (jwt == null) {
    return [];
  }
  final response = await http.get(
      Uri.parse('https://e-commerce-api.dirrocha.com/cart/purchased'),
      headers: {
        'Authorization': 'Bearer $jwt',
      });

  if (response.statusCode == 200) {
    // Decodificar a resposta JSON
    List<dynamic> jsonResponse = json.decode(response.body);

    // Converter cada item da lista em Map<String, dynamic>
    List<Map<String, dynamic>> items =
        jsonResponse.map((item) => item as Map<String, dynamic>).toList();

    return items;
  } else {
    return [];
  }
}
