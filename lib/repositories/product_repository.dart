import 'dart:convert';

import 'package:flutter_redux_learn/models/product.dart';
import 'package:http/http.dart' as http;

const String authority = 'fakestoreapi.com';

class ProductRepository {
  ProductRepository._();
  static final ProductRepository _instance = ProductRepository._();
  static ProductRepository get instance => _instance;

  Future<List<Product>> getProducts() async {
    try {
      Uri uri = Uri.https(authority, '/products');
      final http.Response response = await http.get(uri);
      final List jsonData = jsonDecode(response.body);
      final products = jsonData.map((json) => Product.fromMap(json)).toList();

      return products;
    } catch (e) {
      rethrow;
    }
  }

  Future<Product> getProduct(int id) async {
    try {
      Uri uri = Uri.https(authority, '/products/$id');
      final http.Response response = await http.get(uri);
      final jsonData = jsonDecode(response.body);
      final product = Product.fromMap(jsonData);

      return product;
    } catch (e) {
      rethrow;
    }
  }
}
