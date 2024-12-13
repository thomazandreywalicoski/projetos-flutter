import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/product_service.dart';

class ProductFormScreen extends StatefulWidget {
  final ProductService productService;
  final Product? product;

  ProductFormScreen({required this.productService, this.product});

  @override
  _ProductFormScreenState createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late double _price;
  late int _quantity;

  @override
  void initState() {
    super.initState();
    if (widget.product != null) {
      _name = widget.product!.name;
      _price = widget.product!.price;
      _quantity = widget.product!.quantity;
    } else {
      _name = '';
      _price = 0.0;
      _quantity = 0;
    }
  }

  void _saveProduct() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (widget.product != null) {
        widget.productService.updateProduct(
          Product(
            id: widget.product!.id,
            name: _name,
            price: _price,
            quantity: _quantity,
          ),
        );
      } else {
        widget.productService.addProduct(
          Product(
            id: DateTime.now().toString(),
            name: _name,
            price: _price,
            quantity: _quantity,
          ),
        );
      }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product != null ? 'Editar Produto' : 'Cadastrar Produto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _name,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome do produto';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                initialValue: _price.toString(),
                decoration: InputDecoration(labelText: 'Preço'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o preço do produto';
                  }
                  return null;
                },
                onSaved: (value) {
                  _price = double.parse(value!);
                },
              ),
              TextFormField(
                initialValue: _quantity.toString(),
                decoration: InputDecoration(labelText: 'Quantidade'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a quantidade do produto';
                  }
                  return null;
                },
                onSaved: (value) {
                  _quantity = int.parse(value!);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveProduct,
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}