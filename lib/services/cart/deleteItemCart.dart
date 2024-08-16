import 'package:dirrocha_ecommerce/services/cokiees/getCokiees.dart';
import 'package:http/http.dart' as http;

Future<bool> fetchDeletCartItem(
    {required String productId, required String provider}) async {
  var jwt = await getJwtToken();
  if (jwt == null) {
    return false;
  }

  final response = await http.delete(
    Uri.parse('https://e-commerce-api.dirrocha.com/cart/$provider/$productId'),
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $jwt',
    },
  );
  if (response.statusCode == 204) {
    return true;
  } else {
    return false;
  }
}
