import 'package:flutter_redux_learn/redux/app_state.dart';
import 'package:flutter_redux_learn/redux/product/product_reducer.dart';
import 'package:flutter_redux_learn/redux/products/products_reducer.dart';

ProductsAppState reducer(ProductsAppState state, dynamic action) {
  return ProductsAppState(
    productsState: productsReducer(state.productsState, action),
    productState: productReducer(state.productState, action),
  );
}
