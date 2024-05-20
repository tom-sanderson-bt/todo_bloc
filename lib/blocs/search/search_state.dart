part of 'search_bloc.dart';

class SearchState extends Equatable {
  final String searchText;

  const SearchState({
    required this.searchText,
  });

  factory SearchState.initial() {
    return const SearchState(searchText: '');
  }

  @override
  List<Object> get props => [searchText];

  @override
  String toString() => 'SearchState(searchText: $searchText)';

  SearchState copyWith({
    String? searchText,
  }) {
    return SearchState(
      searchText: searchText ?? this.searchText,
    );
  }
}
