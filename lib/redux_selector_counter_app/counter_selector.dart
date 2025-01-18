import '../redux_selectors/redux_extensions.dart';
import 'counter_state.dart';
import 'redux_reducer.dart';

FeatureSelector<CounterState> selectorProduct = createFeatureSelector<CounterState>(StateKey.counter);

Selector<int> selectCount = createSelector(
  selectorProduct,
  (CounterState state) => state.count,
);

Selector<double> selectThreeQuarters = createSelector(
  selectorProduct,
  (CounterState state) => state.count * 0.75,
);
