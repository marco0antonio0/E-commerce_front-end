import 'dart:convert';
import 'package:http/http.dart' as http;

Future fetchGetProductsByName({
  required String name,
}) async {
  final response = await http.get(
    Uri.parse('https://e-commerce-api.dirrocha.com/products/search?name=$name'),
  );

  if (response.statusCode == 200) {
    // Decodificar a resposta JSON
    List<dynamic> jsonResponse = json.decode(response.body);

    // Converter cada item da lista em Map<String, dynamic>
    List<Map<String, dynamic>> items =
        jsonResponse.map((item) => item as Map<String, dynamic>).toList();

    return items;
  } else {
    // context.go('/404');
    // throw Exception('Falha ao carregar os dados');
    return [];
  }
}
