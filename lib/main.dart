import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_learn/pages/counter_page.dart';
import 'package:flutter_redux_learn/redux_selector_counter_app/redux_reducer.dart';
import 'package:flutter_redux_learn/redux_selectors/redux_extensions.dart';
import 'package:redux/redux.dart';

import 'redux_selector_counter_app/counter_state.dart';

// late final Store<ProductsAppState> store;
late final Store<AppState> store;

void main() {
  // store = Store<ProductsAppState>(
  //   reducer,
  //   initialState: ProductsAppState.initial(),
  //   middleware: appMiddleware(),
  // );
  store = Store<AppState>(
    reduxReducer,
    initialState: AppState(<String, RxState>{
      StateKey.counter: CounterState.initial(),
    }),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return StoreProvider<ProductsAppState>(
//       store: store,
//       child: MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           useMaterial3: true,
//         ),
//         home: const ProductsPage(),
//       ),
//     );
//   }
// }
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CounterPage(),
      ),
    );
  }
}
