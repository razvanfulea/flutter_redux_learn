import 'package:redux/redux.dart';

import '../redux_selectors/redux_extensions.dart';
import 'counter_action.dart';
import 'counter_selector.dart';
import 'counter_state.dart';
import 'redux_reducer.dart';

void main() {
  Store<AppState> store = Store<AppState>(
    reduxReducer,
    initialState: AppState(<String, RxState>{
      StateKey.counter: CounterState.initial(),
    }),
  );

  int result = store.select(selectCount);
  double result2 = store.select(selectThreeQuarters);

  print(result);
  print(result2);

  store.dispatch(IncrementAction(value: 5));
  result = store.select(selectCount);
  print(result);

  store.dispatch(MultiplyAction(value: 5));
  result = store.select(selectCount);
  print(result);

  store.dispatch(IncrementAction(value: -10));
  result = store.select(selectCount);
  print(result);

  store.dispatch(IncrementAction(value: 0));
  result = store.select(selectCount);
  print(result);

  store.dispatch(MultiplyAction(value: 1));
  result = store.select(selectCount);
  print(result);
}
