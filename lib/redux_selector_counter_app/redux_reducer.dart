import '../redux_selectors/redux_extensions.dart';
import 'counter_reducer.dart';

abstract final class StateKey {
  static const String counter = 'counter';
}

Map<String, dynamic> _stateReducers = <String, dynamic>{
  StateKey.counter: counterReducer as dynamic,
};

AppState reduxReducer(AppState state, dynamic action) {
  return AppState(_stateReducers.map(
    (key, reducer) => MapEntry<String, RxState>(
      key,
      reducer(state[key], action),
    ),
  ));
}
