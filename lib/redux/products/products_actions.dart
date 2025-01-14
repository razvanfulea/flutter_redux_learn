import '../../models/product.dart';

class GetProductsAction {}

class GetProductsSuccessAction {
  final List<Product> products;

  GetProductsSuccessAction({
    required this.products,
  });
}

class GetProductsFailedAction {
  final String error;

  GetProductsFailedAction({
    required this.error,
  });

  @override
  String toString() => 'GetProductsFailedAction{error: $error}';
}
