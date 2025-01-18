import 'package:redux/redux.dart';

import 'counter_action.dart';
import 'counter_state.dart';

CounterState _incrementReducer(CounterState state, IncrementAction action) {
  return state.copyWith(count: state.count + action.value);
}

CounterState _multiplyReducer(CounterState state, MultiplyAction action) {
  return state.copyWith(count: state.count * action.value);
}

Reducer<CounterState> counterReducer = combineReducers([
  TypedReducer<CounterState, IncrementAction>(_incrementReducer).call,
  TypedReducer<CounterState, MultiplyAction>(_multiplyReducer).call,
]);
