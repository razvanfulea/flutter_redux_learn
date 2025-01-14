import 'package:flutter_redux_learn/redux/app_state.dart';
import 'package:flutter_redux_learn/redux/product/product_actions.dart';
import 'package:flutter_redux_learn/redux/products/products_actions.dart';
import 'package:redux/redux.dart';

import '../models/product.dart';
import '../repositories/product_repository.dart';

void productInfoMiddleware(Store<AppState> store, action, NextDispatcher next) {
  if (action is GetProductsAction) {
    ProductRepository.instance.getProducts().then((List<Product> products) {
      store.dispatch(GetProductsSuccessAction(products: products));
    }).catchError((error) {
      store.dispatch(GetProductsFailedAction(error: error.toString()));
    });
  } else if (action is GetProductAction) {
    ProductRepository.instance.getProduct(action.id).then((Product product) {
      store.dispatch(GetProductSuccessAction(product: product));
    }).catchError((error) {
      store.dispatch(GetProductFailedAction(error: error.toString()));
    });
  }

  next(action);
}
