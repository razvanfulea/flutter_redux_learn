import 'package:equatable/equatable.dart';
import 'package:flutter_redux_learn/redux/product/product_state.dart';
import 'package:flutter_redux_learn/redux/products/products_state.dart';

class ProductsAppState extends Equatable {
  final ProductsState productsState;
  final ProductState productState;

//<editor-fold desc="Data Methods">
  const ProductsAppState({
    required this.productState,
    required this.productsState,
  });

  factory ProductsAppState.initial() {
    return ProductsAppState(
      productsState: ProductsState.initial(),
      productState: ProductState.initial(),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductsAppState &&
          runtimeType == other.runtimeType &&
          productsState == other.productsState &&
          productState == other.productState);

  @override
  int get hashCode => productsState.hashCode & productState.hashCode;

  @override
  String toString() => 'AppState{productsState: $productsState, productState: $productState}';

  ProductsAppState copyWith({
    ProductsState? productsState,
    ProductState? productState,
  }) {
    return ProductsAppState(
      productsState: productsState ?? this.productsState,
      productState: productState ?? this.productState,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productsState': productsState,
      'productState': productState,
    };
  }

  factory ProductsAppState.fromMap(Map<String, dynamic> map) {
    return ProductsAppState(
      productsState: map['productsState'] as ProductsState,
      productState: map['productState'] as ProductState,
    );
  }

  @override
  List<Object?> get props => [productsState, productState];

//</editor-fold>
}
