import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState.initial()) {
    on<UpdateSearchEvent>((event, emit) {
      emit(state.copyWith(searchText: event.searchText));
    }, transformer: debounce(const Duration(milliseconds: 1000)));
  }

  EventTransformer<UpdateSearchEvent> debounce<UpdateSearchEvent>(
      Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
