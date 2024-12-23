class CartItem {
  final String imageUrl;
  final String name;
  final double price;
  int quantity;

  CartItem({
    required this.imageUrl,
    required this.name,
    required this.price,
    this.quantity = 1,
  });
}
