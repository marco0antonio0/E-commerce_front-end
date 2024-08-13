// lib/entities/item_entity.dart
class ItemEntity {
  String id;
  String price;
  String title;
  String subtitle;
  String imgUrl;
  String provider;

  ItemEntity({
    required this.id,
    required this.provider,
    required this.price,
    required this.title,
    this.subtitle = '',
    this.imgUrl = '',
  });
}
