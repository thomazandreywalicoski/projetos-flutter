import '../models/product.dart';

class ProductService {
  final List<Product> _products = [];

  List<Product> get products => _products;

  void addProduct(Product product) {
    _products.add(product);
  }

  void updateProduct(Product updatedProduct) {
    final index = _products.indexWhere((product) => product.id == updatedProduct.id);
    if (index != -1) {
      _products[index] = updatedProduct;
    }
  }

  void deleteProduct(String id) {
    _products.removeWhere((product) => product.id == id);
  }

  double get totalValue {
    return _products.fold(0, (sum, product) => sum + (product.price * product.quantity));
  }

  int get totalQuantity {
    return _products.fold(0, (sum, product) => sum + product.quantity);
  }
}