import 'package:http/http.dart' as http;

Future<bool> fetchIsValidToken(String token) async {
  // Configurando o corpo da requisição como application/x-www-form-urlencoded
  final body = {
    'token': token,
  };

  final response = await http.post(
    Uri.parse('https://e-commerce-api.dirrocha.com/user/check-token'),
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: body,
  );

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
