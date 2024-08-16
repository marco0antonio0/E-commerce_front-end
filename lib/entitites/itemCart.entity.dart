class CartItem {
  final String id;
  final String productId;
  final String quantity;
  final String userEmail;
  final bool purchased;
  final String provider;
  final DateTime createdAt;
  final DateTime updatedAt;

  CartItem({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.userEmail,
    required this.purchased,
    required this.provider,
    required this.createdAt,
    required this.updatedAt,
  });
}
