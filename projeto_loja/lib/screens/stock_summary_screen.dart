import 'package:flutter/material.dart';
import '../services/product_service.dart';

class StockSummaryScreen extends StatelessWidget {
  final ProductService productService;

  StockSummaryScreen({required this.productService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resumo do Estoque'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total de Produtos: ${productService.totalQuantity}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Valor Total: R\$ ${productService.totalValue.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}