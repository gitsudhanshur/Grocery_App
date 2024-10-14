class Product {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final double originalPrice; 
  final bool isInCart;
  final int discount;

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    this.originalPrice = 0.0,
    this.isInCart = false,
    this.discount = 0,
  });
}
