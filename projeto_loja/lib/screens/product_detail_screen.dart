import 'package:flutter/material.dart';
import '../models/product.dart';
import 'product_form_screen.dart';
import '../services/product_service.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    final ProductService productService = ProductService();

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductFormScreen(
                    productService: productService,
                    product: product,
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              productService.deleteProduct(product.id);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text('Preço: R\$ ${product.price.toStringAsFixed(2)}'),
            SizedBox(height: 8.0),
            Text('Quantidade: ${product.quantity}'),
          ],
        ),
      ),
    );
  }
}