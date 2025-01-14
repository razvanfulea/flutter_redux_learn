import 'package:equatable/equatable.dart';
import 'package:flutter_redux_learn/models/product.dart';

enum ProductStatus {
  initial,
  loading,
  success,
  failure,
}

class ProductState extends Equatable {
  final ProductStatus productStatus;
  final Product product;
  final String error;

//<editor-fold desc="Data Methods">
  const ProductState({
    required this.productStatus,
    required this.product,
    required this.error,
  });

  factory ProductState.initial() {
    return ProductState(
      productStatus: ProductStatus.initial,
      product: Product.initial(),
      error: '',
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductState &&
          runtimeType == other.runtimeType &&
          productStatus == other.productStatus &&
          product == other.product &&
          error == other.error);

  @override
  int get hashCode => productStatus.hashCode ^ product.hashCode ^ error.hashCode;

  @override
  String toString() => 'ProductState{ productStatus: $productStatus, product: $product, error: $error,}';

  ProductState copyWith({
    ProductStatus? productStatus,
    Product? product,
    String? error,
  }) {
    return ProductState(
      productStatus: productStatus ?? this.productStatus,
      product: product ?? this.product,
      error: error ?? this.error,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productStatus': productStatus,
      'product': product,
      'error': error,
    };
  }

  factory ProductState.fromMap(Map<String, dynamic> map) {
    return ProductState(
      productStatus: map['productStatus'] as ProductStatus,
      product: map['product'] as Product,
      error: map['error'] as String,
    );
  }

  @override
  List<Object?> get props => [productStatus, product, error];

//</editor-fold>
}
