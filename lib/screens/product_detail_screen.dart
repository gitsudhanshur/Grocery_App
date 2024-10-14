import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProduct = Provider.of<ProductProvider>(
      context,
      listen: false,
    ).findById(productId);

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.name),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Image.asset(
                  loadedProduct.imageUrl,
                  fit: BoxFit.contain,
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.6,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '\$${loadedProduct.price}',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 28,
                ),
              ),
              if (loadedProduct.originalPrice > loadedProduct.price)
                Text(
                  '\$${loadedProduct.originalPrice}',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              SizedBox(height: 10),
              Text(
                'Discount: ${loadedProduct.discount}% OFF',
                style: TextStyle(color: Colors.green, fontSize: 16),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Description for ${loadedProduct.name} goes here.',
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Provider.of<ProductProvider>(context, listen: false)
                      .toggleCartStatus(productId);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: loadedProduct.isInCart ? Colors.grey : Colors.green,
                ),
                child: Text(
                  loadedProduct.isInCart ? 'Remove from Cart' : 'Add to Cart',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
