import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_learn/redux_selector_counter_app/counter_action.dart';
import 'package:flutter_redux_learn/redux_selectors/redux_extensions.dart';
import 'package:redux/redux.dart';

import '../redux_selector_counter_app/counter_selector.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StoreConnector<AppState, _ViewModel>(
        distinct: true,
        converter: _ViewModel.fromStore,
        builder: (context, vm) {
          print("Rebuilding...");
          return Center(
            child: Column(
              children: [
                Text('Count: ${vm.counter}'),
                ElevatedButton(onPressed: vm.addOne, child: const Text('Add 1')),
                ElevatedButton(onPressed: vm.addZero, child: const Text('Add 0')),
                ElevatedButton(onPressed: vm.multiplyTwo, child: const Text('Multiply 2')),
                ElevatedButton(onPressed: vm.multiplyOne, child: const Text('Multiply 1')),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ViewModel extends Equatable {
  final int counter;
  final VoidCallback addOne;
  final VoidCallback addZero;
  final VoidCallback multiplyTwo;
  final VoidCallback multiplyOne;

  factory _ViewModel.fromStore(Store<AppState> store) {
    return _ViewModel(
      counter: store.select(selectCount),
      addOne: () => store.dispatch(IncrementAction(value: 1)),
      addZero: () => store.dispatch(IncrementAction(value: 0)),
      multiplyTwo: () => store.dispatch(MultiplyAction(value: 2)),
      multiplyOne: () => store.dispatch(MultiplyAction(value: 1)),
    );
  }

  const _ViewModel(
      {required this.counter,
      required this.addOne,
      required this.addZero,
      required this.multiplyTwo,
      required this.multiplyOne});

  @override
  List<Object?> get props => [counter];
}
