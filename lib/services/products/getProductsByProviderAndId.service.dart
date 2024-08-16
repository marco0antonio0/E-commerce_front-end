import 'dart:convert';
import 'package:http/http.dart' as http;

Future fetchItemsByProviderAndId({
  required String provider,
  required String id,
}) async {
  final response = await http.get(
    Uri.parse('https://e-commerce-api.dirrocha.com/products/$provider/$id'),
  );

  if (response.statusCode == 200) {
    // Decodificar a resposta JSON
    Map<String, dynamic> jsonResponse = json.decode(response.body);
    return jsonResponse;
  } else {
    // context.go('/404');
    // throw Exception('Falha ao carregar os dados');
    return null;
  }
}
