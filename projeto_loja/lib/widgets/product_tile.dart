import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  ProductTile({required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.inventory),
      title: Text(product.name),
      subtitle: Text('R\$ ${product.price.toStringAsFixed(2)} - ${product.quantity} unidades'),
      onTap: onTap,
    );
  }
}