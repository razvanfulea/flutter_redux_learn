import 'package:flutter_redux_learn/redux/products/products_actions.dart';
import 'package:flutter_redux_learn/redux/products/products_state.dart';
import 'package:redux/redux.dart';

ProductsState getProductsReducer(ProductsState state, GetProductsAction action) {
  return state.copyWith(productsStatus: ProductsStatus.loading);
}

ProductsState getProductsSuccessReducer(
  ProductsState state,
  GetProductsSuccessAction action,
) {
  return state.copyWith(
    productsStatus: ProductsStatus.success,
    products: action.products,
  );
}

ProductsState getProductsFailedReducer(
  ProductsState state,
  GetProductsFailedAction action,
) {
  return state.copyWith(
    productsStatus: ProductsStatus.failure,
    error: action.error,
  );
}

Reducer<ProductsState> productsReducer = combineReducers([
  TypedReducer<ProductsState, GetProductsAction>(getProductsReducer).call,
  TypedReducer<ProductsState, GetProductsSuccessAction>(getProductsSuccessReducer).call,
  TypedReducer<ProductsState, GetProductsFailedAction>(getProductsFailedReducer).call,
]);
