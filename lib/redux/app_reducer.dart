import 'package:flutter_redux_learn/redux/app_state.dart';
import 'package:flutter_redux_learn/redux/product/product_reducer.dart';
import 'package:flutter_redux_learn/redux/products/products_reducer.dart';

AppState reducer(AppState state, dynamic action) {
  return AppState(
    productsState: productsReducer(state.productsState, action),
    productState: productReducer(state.productState, action),
  );
}
