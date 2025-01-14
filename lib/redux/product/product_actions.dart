import 'package:flutter_redux_learn/models/product.dart';

class GetProductAction {
  final int id;

  GetProductAction({required this.id});

  @override
  String toString() => 'GetProductAction{id: $id}';
}

class GetProductSuccessAction {
  final Product product;

  GetProductSuccessAction({required this.product});
}

class GetProductFailedAction {
  final String error;

  GetProductFailedAction({required this.error});
}
