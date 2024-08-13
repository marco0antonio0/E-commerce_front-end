// lib/services/item_service.dart

import 'package:dirrocha_ecommerce/entitites/item.entity.dart';
import 'package:dirrocha_ecommerce/services/validarItem/abstract-validar.dart';

class ItemService implements ValidationItem {
  final List<Map<String, dynamic>> data;
  List<ItemEntity> products = [];

  ItemService({required this.data});

  @override
  Map<String, dynamic> providerBrazilian(Map<String, dynamic> item) {
    return {
      'id': item['id'],
      'provider': item['provider'],
      'price': item['preco'],
      'title': item['nome'],
      'subtitle': item['descricao'],
      'imgUrl': item['imagem'] is List && item['imagem'].isNotEmpty
          ? item['imagem'][0]
          : item['imagem'] ?? '',
    };
  }

  @override
  Map<String, dynamic> providerOthers(Map<String, dynamic> item) {
    return {
      'id': item['id'],
      'provider': item['provider'],
      'price': item['price'],
      'title': item['name'],
      'subtitle': item['description'] is Map
          ? 'adjective ${item['description']['adjective'] ?? ''} material ${item['description']['material'] ?? ''}'
          : item['description'] ?? '',
      'imgUrl': item['gallery'] is List && item['gallery'].isNotEmpty
          ? item['gallery'][0]
          : item['gallery'] ?? '',
    };
  }

  @override
  ItemEntity switchProvider(Map<String, dynamic> item) {
    final data = item['provider'] == 'brazilian'
        ? providerBrazilian(item)
        : providerOthers(item);

    return ItemEntity(
      id: data['id'],
      provider: data['provider'],
      price: data['price'],
      title: data['title'],
      subtitle: data['subtitle'],
      imgUrl: data['imgUrl'],
    );
  }

  @override
  void validarItens() {
    products = data.map((item) => switchProvider(item)).toList();
  }

  @override
  ItemEntity getItem(int index) {
    return products[index];
  }

  @override
  int getLength() {
    return products.length;
  }
}
