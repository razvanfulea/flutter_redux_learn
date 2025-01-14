import 'package:flutter_redux_learn/redux/product/product_actions.dart';
import 'package:flutter_redux_learn/redux/product/product_state.dart';
import 'package:redux/redux.dart';

ProductState getProductReducer(ProductState state, GetProductAction action) {
  return state.copyWith(productStatus: ProductStatus.loading);
}

ProductState getProductSuccessReducer(ProductState state, GetProductSuccessAction action) {
  return state.copyWith(
    productStatus: ProductStatus.success,
    product: action.product,
  );
}

ProductState getProductFailedReducer(ProductState state, GetProductFailedAction action) {
  return state.copyWith(
    productStatus: ProductStatus.failure,
    error: action.error,
  );
}

Reducer<ProductState> productReducer = combineReducers([
  TypedReducer<ProductState, GetProductAction>(getProductReducer).call,
  TypedReducer<ProductState, GetProductSuccessAction>(getProductSuccessReducer).call,
  TypedReducer<ProductState, GetProductFailedAction>(getProductFailedReducer).call,
]);
