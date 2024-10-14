import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: '1',
      name: 'Britannia Eggless Cake',
      imageUrl: 'assets/images/cake.png',
      price: 2.99,
      originalPrice: 4.99,
      isInCart: false,
      discount: 40,
    ),
    Product(
      id: '2',
      name: 'Thums Up/ Fanta / Limca',
      imageUrl: 'assets/images/drinks.png',
      price: 4.49,
      originalPrice: 4.99,
      isInCart: true,
      discount: 10,
    ),
    Product(
      id: '3',
      name: 'Harroz Basmati Rice 8lb',
      imageUrl: 'assets/images/Harroz rice.png',
      price: 9.99,
      originalPrice: 14.99,
      isInCart: false,
      discount: 33,
    ),
    Product(
      id: '4',
      name: 'Nature Gift Basmati Rice',
      imageUrl: 'assets/images/Nature rice.png',
      price: 9.99,
      originalPrice: 13.99,
      isInCart: false,
      discount: 29,
    ),
    Product(
      id: '5',
      name: 'Red Onion Bag 10lb',
      imageUrl: 'assets/images/Red onion 10lb.png',
      price: 4.49,
      originalPrice: 4.99,
      isInCart: false,
      discount: 10,
    ),
    Product(
      id: '6',
      name: 'Red Onions',
      imageUrl: 'assets/images/Red Onion.png',
      price: 4.49,
      originalPrice: 4.99,
      isInCart: false,
      discount: 10,
    ),
    Product(
      id: '7',
      name: 'Maaza',
      imageUrl: 'assets/images/maaza.png',
      price: 3.49,
      originalPrice: 6.99,
      isInCart: true,
      discount: 40,
    ),
    Product(
      id: '8',
      name: 'Bikaneri Bhujia',
      imageUrl: 'assets/images/Mixture.png',
      price: 2.49,
      originalPrice: 4.99,
      isInCart: false,
      discount: 50,
    ),
  ];

  List<Product> get products {
    return [..._products];
  }

  Product findById(String id) {
    return _products.firstWhere((product) => product.id == id);
  }

  void toggleCartStatus(String id) {
    final productIndex = _products.indexWhere((product) => product.id == id);
    if (productIndex >= 0) {
      _products[productIndex] = Product(
        id: _products[productIndex].id,
        name: _products[productIndex].name,
        imageUrl: _products[productIndex].imageUrl,
        price: _products[productIndex].price,
        originalPrice: _products[productIndex].originalPrice,
        isInCart: !_products[productIndex].isInCart,
        discount: _products[productIndex].discount,
      );
      notifyListeners();
    }
  }
}
