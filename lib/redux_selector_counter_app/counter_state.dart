import 'package:equatable/equatable.dart';

import '../redux_selectors/redux_extensions.dart';

class CounterState extends Equatable implements RxState {
  final int count;

  factory CounterState.initial() {
    return const CounterState(count: 0);
  }

  @override
  List<Object?> get props => [count];

  const CounterState({required this.count});

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is CounterState && runtimeType == other.runtimeType && count == other.count);

  @override
  int get hashCode => count.hashCode;

  @override
  String toString() => 'CounterState{ count: $count,}';

  CounterState copyWith({int? count}) {
    return CounterState(count: count ?? this.count);
  }

  Map<String, dynamic> toMap() => {'count': count};

  factory CounterState.fromMap(Map<String, dynamic> map) => CounterState(count: map['count'] as int);

  @override
  // TODO: implement stringify
  bool? get stringify => true;
}
