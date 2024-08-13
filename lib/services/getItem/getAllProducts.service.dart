import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Map<String, dynamic>>> fetchItems() async {
  final response =
      await http.get(Uri.parse('https://e-commerce-api.dirrocha.com/products'));

  if (response.statusCode == 200) {
    // Decodificar a resposta JSON
    List<dynamic> jsonResponse = json.decode(response.body);

    // Converter cada item da lista em Map<String, dynamic>
    List<Map<String, dynamic>> items =
        jsonResponse.map((item) => item as Map<String, dynamic>).toList();

    return items;
  } else {
    throw Exception('Falha ao carregar os dados');
  }
}
