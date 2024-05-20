part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class UpdateSearchEvent extends SearchEvent {
  final String searchText;

  const UpdateSearchEvent({required this.searchText});

  @override
  List<Object> get props => [searchText];

  @override
  String toString() => 'UpdateSearchEvent(searchText: $searchText)';
}
