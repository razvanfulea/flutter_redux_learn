import 'package:flutter_redux_learn/redux/app_state.dart';
import 'package:flutter_redux_learn/redux/product/product_actions.dart';
import 'package:flutter_redux_learn/repositories/product_repository.dart';
import 'package:redux/redux.dart';

import '../../models/product.dart';

void productMiddleware(Store<ProductsAppState> store, action, NextDispatcher next) {
  if (action is GetProductAction) {
    ProductRepository.instance.getProduct(action.id).then((Product product) {
      store.dispatch(GetProductSuccessAction(product: product));
    }).catchError((error) {
      store.dispatch(GetProductFailedAction(error: error.toString()));
    });
  }

  next(action);
}
