import 'package:dirrocha_ecommerce/entitites/item.entity.dart';

abstract class ValidationItem {
  Map<String, dynamic> providerBrazilian(Map<String, dynamic> item);
  Map<String, dynamic> providerOthers(Map<String, dynamic> item);
  ItemEntity switchProvider(Map<String, dynamic> item);
  void validarItens();
  ItemEntity getItem(int index);
  int getLength();
}
