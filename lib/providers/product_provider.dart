import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];

  // Initial products (same as HTML)
  final List<Product> _initialProducts = [
    Product(
      id: 1,
      name: 'Bicycle',
      description: 'A high-quality, durable bicycle for city or trail riding.',
      price: 150.00,
      image:
          'https://www.sunmono.com.au/wp-content/uploads/2024/01/GD5A8354.jpg',
    ),
    Product(
      id: 2,
      name: 'Camera',
      description: 'Capture life\'s moments in stunning detail.',
      price: 4999.50,
      image:
          'https://t3.ftcdn.net/jpg/02/79/69/44/360_F_279694441_AavYq4NbfcdMpXi0VD92r070Me1kxTOx.jpg',
    ),
    Product(
      id: 3,
      name: 'Bag',
      description: 'A stylish and spacious bag for all your essentials.',
      price: 22.75,
      image:
          'https://safaribags.com/cdn/shop/files/2_3d6acc65-50a9-4d45-b83c-31bb315d7b05_1024x.jpg?v=1707731912',
    ),
    Product(
      id: 4,
      name: 'Tie',
      description: 'A classic accessory to complete your professional look.',
      price: 16.99,
      image:
          'https://eu-images.contentstack.com/v3/assets/blt7dcd2cfbc90d45de/blt7b34ac1f7acec8cc/66684d5529d89fdda7a0e4ea/34088-1-1-tiesies.jpg?format=pjpg&auto=webp&quality=75%2C90&width=1200',
    ),
    Product(
      id: 5,
      name: 'Iphones',
      description: 'The latest model with a powerful chip and camera.',
      price: 1350.00,
      image: 'https://i.ytimg.com/vi/d-rSu01rXV8/maxresdefault.jpg',
    ),
    Product(
      id: 6,
      name: 'Headphones',
      description: 'Noise-cancelling headphones for an immersive experience.',
      price: 150.00,
      image:
          'https://www.sennheiser.com/cdn-cgi/image/width=1920,format=avif,quality=75/globalassets/digizuite/45735-en-hd_490_pro_product_shot_in_use_axis_audio_69.jpg/SennheiserFullWidth',
    ),
    Product(
      id: 7,
      name: 'Tennis Shoes',
      description: 'High-performance tennis shoes for athletes.',
      price: 69.99,
      image:
          'https://i.ytimg.com/vi/NBJ9wL22L3g/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLBezYcYQST7ZvDdKDpkj2Dd65go6w',
    ),
    Product(
      id: 8,
      name: 'Laptop',
      description: 'A powerful laptop for work, school, and entertainment.',
      price: 999.50,
      image:
          'https://assets.mmsrg.com/isr/166325/c1/-/ASSET_MMS_157207033/fee_786_587_png',
    ),
    Product(
      id: 9,
      name: 'GYM Equipment',
      description: 'Essential gym equipment for your home workout.',
      price: 999.00,
      image:
          'https://img.freepik.com/premium-photo/barbell-weights-moody-gym_406939-18250.jpg',
    ),
    Product(
      id: 10,
      name: 'Boots',
      description: 'Stylish and durable boots for any weather.',
      price: 76.50,
      image:
          'https://ht.come4buy.com/cdn/shop/products/casual-business-shoes-men-dress-office-230419003033.jpg?v=1681910604',
    ),
    Product(
      id: 11,
      name: 'Belt',
      description: 'A classic leather belt to complement any outfit.',
      price: 9.50,
      image:
          'https://www.thewalletstore.in/cdn/shop/files/1._2.jpg?v=1698918186&width=2048',
    ),
    Product(
      id: 12,
      name: 'Sample Book',
      description: 'A compelling book to expand your mind and knowledge.',
      price: 15.00,
      image:
          'https://www.theinterrobang.ca/images/interrobang/060719/3QGHZ6F8EYSNPM2C.jpg',
    ),
  ];

  ProductProvider() {
    _loadProducts();
  }

  List<Product> get products => _products;

  Future<void> _loadProducts() async {
    final prefs = await SharedPreferences.getInstance();
    final productsJson = prefs.getString('products');

    if (productsJson != null) {
      final List<dynamic> decoded = jsonDecode(productsJson);
      _products = decoded.map((json) => Product.fromJson(json)).toList();
    } else {
      _products = List.from(_initialProducts);
      await _saveProducts();
    }
    notifyListeners();
  }

  Future<void> _saveProducts() async {
    final prefs = await SharedPreferences.getInstance();
    final productsJson = jsonEncode(_products.map((p) => p.toJson()).toList());
    await prefs.setString('products', productsJson);
  }

  Future<void> addProduct(Product product) async {
    _products.add(product);
    await _saveProducts();
    notifyListeners();
  }

  Future<void> updateProduct(Product product) async {
    final index = _products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      _products[index] = product;
      await _saveProducts();
      notifyListeners();
    }
  }

  Future<void> deleteProduct(int productId) async {
    _products.removeWhere((p) => p.id == productId);
    await _saveProducts();
    notifyListeners();
  }

  int getNextId() {
    if (_products.isEmpty) return 1;
    return _products.map((p) => p.id).reduce((a, b) => a > b ? a : b) + 1;
  }

  List<Product> searchProducts(String query) {
    if (query.isEmpty) return _products;
    final lowerQuery = query.toLowerCase();
    return _products
        .where(
          (p) =>
              p.name.toLowerCase().contains(lowerQuery) ||
              p.description.toLowerCase().contains(lowerQuery),
        )
        .toList();
  }
}
