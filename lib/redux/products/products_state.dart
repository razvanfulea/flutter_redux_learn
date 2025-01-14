import 'package:equatable/equatable.dart';
import 'package:flutter_redux_learn/models/product.dart';

enum ProductsStatus {
  initial,
  loading,
  success,
  failure,
}

class ProductsState extends Equatable {
  final ProductsStatus productsStatus;
  final List<Product> products;
  final String error;

  @override
  List<Object?> get props => [productsStatus, products, error];

//<editor-fold desc="Data Methods">
  const ProductsState({
    required this.productsStatus,
    required this.products,
    required this.error,
  });

  factory ProductsState.initial() {
    return const ProductsState(
      productsStatus: ProductsStatus.initial,
      products: [],
      error: '',
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductsState &&
          runtimeType == other.runtimeType &&
          productsStatus == other.productsStatus &&
          products == other.products &&
          error == other.error);

  @override
  int get hashCode =>
      productsStatus.hashCode ^ products.hashCode ^ error.hashCode;

  @override
  String toString() {
    return 'ProductsState{ productsStatus: $productsStatus, products: $products, error: $error,}';
  }

  ProductsState copyWith({
    ProductsStatus? productsStatus,
    List<Product>? products,
    String? error,
  }) {
    return ProductsState(
      productsStatus: productsStatus ?? this.productsStatus,
      products: products ?? this.products,
      error: error ?? this.error,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productsStatus': productsStatus,
      'products': products,
      'error': error,
    };
  }

  factory ProductsState.fromMap(Map<String, dynamic> map) {
    return ProductsState(
      productsStatus: map['productsStatus'] as ProductsStatus,
      products: map['products'] as List<Product>,
      error: map['error'] as String,
    );
  }

//</editor-fold>
}
