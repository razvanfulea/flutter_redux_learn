import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_learn/models/product.dart';
import 'package:flutter_redux_learn/redux/app_state.dart';
import 'package:flutter_redux_learn/redux/product/product_actions.dart';
import 'package:flutter_redux_learn/redux/product/product_state.dart';
import 'package:redux/redux.dart';

class ProductPage extends StatelessWidget {
  final int productId;
  const ProductPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: StoreConnector<AppState, _ViewModel>(
        distinct: true,
        onInit: (Store<AppState> store) {
          store.dispatch(GetProductAction(id: productId));
        },
        onWillChange: (_ViewModel? prev, _ViewModel current) {
          if (current.status == ProductStatus.failure) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('ERROR'),
                    content: Text(current.error),
                  );
                });
          }
        },
        converter: _ViewModel.fromStore,
        builder: (BuildContext context, _ViewModel vm) {
          if (vm.status == ProductStatus.initial) {
            return Container();
          } else if (vm.status == ProductStatus.loading) {
            return const CircularProgressIndicator();
          } else if (vm.status == ProductStatus.failure) {
            return Text(
              'Cannot load product $productId',
              style: const TextStyle(color: Colors.red),
            );
          }
          final product = vm.product;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      '\$${product.price}',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Image.network(
                    product.image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ViewModel extends Equatable {
  final Product product;
  final ProductStatus status;
  final String error;

//<editor-fold desc="Data Methods">
  const _ViewModel({
    required this.product,
    required this.status,
    required this.error,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      product: store.state.productState.product,
      status: store.state.productState.productStatus,
      error: store.state.productState.error,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is _ViewModel &&
          runtimeType == other.runtimeType &&
          product == other.product &&
          status == other.status &&
          error == other.error);

  @override
  int get hashCode => product.hashCode ^ status.hashCode ^ error.hashCode;

  @override
  String toString() => '_ViewModel{ product: $product, status: $status, error: $error,}';

  _ViewModel copyWith({
    Product? product,
    ProductStatus? status,
    String? error,
  }) {
    return _ViewModel(
      product: product ?? this.product,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'product': product,
      'status': status,
      'error': error,
    };
  }

  factory _ViewModel.fromMap(Map<String, dynamic> map) {
    return _ViewModel(
      product: map['product'] as Product,
      status: map['status'] as ProductStatus,
      error: map['error'] as String,
    );
  }

  @override
  List<Object?> get props => [product, status, error];

//</editor-fold>
}
