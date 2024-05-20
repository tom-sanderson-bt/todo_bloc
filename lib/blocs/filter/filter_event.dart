part of 'filter_bloc.dart';

abstract class FilterEvent extends Equatable {
  const FilterEvent();
}

class SetFilterEvent extends FilterEvent {
  final Filter filter;

  @override
  List<Object> get props => [filter];

  const SetFilterEvent({required this.filter});

  @override
  String toString() => 'SetFilterEvent(filter: $filter)';
}
