import 'package:flutter/material.dart';
import 'product_form_screen.dart';
import 'product_detail_screen.dart';
import 'stock_summary_screen.dart';
import '../services/product_service.dart';
import '../widgets/product_tile.dart';

class ProductListScreen extends StatelessWidget {
  final ProductService _productService = ProductService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductFormScreen(productService: _productService)),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.analytics),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StockSummaryScreen(productService: _productService)),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _productService.products.length,
        itemBuilder: (context, index) {
          final product = _productService.products[index];
          return ProductTile(
            product: product,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductDetailScreen(product: product)),
              );
            },
          );
        },
      ),
    );
  }
}