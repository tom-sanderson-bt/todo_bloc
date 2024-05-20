part of 'filter_bloc.dart';

enum Filter { all, completed, active }

class FilterState extends Equatable {
  final Filter filter;

  const FilterState({required this.filter});

  factory FilterState.initial() {
    return const FilterState(filter: Filter.all);
  }

  FilterState copyWith({
    Filter? filter,
  }) {
    return FilterState(
      filter: filter ?? this.filter,
    );
  }

  @override
  String toString() => 'FilterState(filter: $filter)';

  @override
  List<Object> get props => [filter];
}
