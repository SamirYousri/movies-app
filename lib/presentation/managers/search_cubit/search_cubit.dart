import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/domain/use_case/search_movies_use_case.dart';
import 'package:movies_app/presentation/managers/search_cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchMovies searchMoviesUseCase;

  SearchCubit(this.searchMoviesUseCase) : super(SearchInitial());

  void searchMovies(String query) async {
    if (query.isEmpty) return;
    emit(SearchLoading());
    try {
      final movies = await searchMoviesUseCase(query);
      emit(SearchLoaded(movies));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}
