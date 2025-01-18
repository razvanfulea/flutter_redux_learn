import 'package:redux/redux.dart';

abstract class RxState {
  const RxState();
}

// // TODO: depend on Equatable?
// class AppState extends Equatable {
//   final Map<String, RxState> states;
//
//   RxState operator [](String key) => states[key] ?? (throw Exception('No state registered for key $key'));
//
//   const AppState(this.states);
//
//   @override
//   List<Object?> get props => <Object?>[states.hashCode];
// }

class AppState {
  final Map<String, RxState> states;

  RxState operator [](String key) => states[key] ?? (throw Exception('No state registered for key $key'));

  // factory

  const AppState(this.states);
}

typedef FeatureSelector<T extends RxState> = T Function(AppState state);
typedef StateProjector<T extends RxState, R> = R Function(T state);
typedef Selector<R> = R Function(AppState state);

FeatureSelector<T> createFeatureSelector<T extends RxState>(String key) {
  return (AppState state) => (state[key] as T);
}

Selector<R> createSelector<T extends RxState, R>(FeatureSelector<T> featureSelector, StateProjector<T, R> projector) {
  return (AppState state) => projector(featureSelector(state));
}

extension StoreSelector on Store<AppState> {
  R select<R>(Selector<R> selector) {
    return selector(state);
  }
}
