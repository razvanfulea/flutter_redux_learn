import 'package:flutter_redux_learn/models/product.dart';
import 'package:flutter_redux_learn/redux/app_state.dart';
import 'package:flutter_redux_learn/redux/products/products_actions.dart';
import 'package:flutter_redux_learn/repositories/product_repository.dart';
import 'package:redux/redux.dart';

void productsMiddleware(Store<AppState> store, action, NextDispatcher next) {
  if (action is GetProductsAction) {
    ProductRepository.instance.getProducts().then((List<Product> products) {
      store.dispatch(GetProductsSuccessAction(products: products));
    }).catchError((error) {
      store.dispatch(GetProductsFailedAction(error: error.toString()));
    });
  }

  next(action);
}
