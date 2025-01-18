import 'package:flutter_redux_learn/redux/app_state.dart';
import 'package:flutter_redux_learn/redux/product/product_middleware.dart';
import 'package:flutter_redux_learn/redux/products/products_middleware.dart';
import 'package:redux/redux.dart';

List<Middleware<ProductsAppState>> appMiddleware() {
  return [productsMiddleware, productMiddleware];
}
