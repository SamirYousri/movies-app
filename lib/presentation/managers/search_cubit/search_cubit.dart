import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/domain/use_case/search_movies_use_case.dart';
import 'package:movies_app/presentation/managers/search_cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchMoviesUseCase searchMovies;

  SearchCubit(this.searchMovies) : super(SearchInitial());

  void searchMoviesByQuery(String query) async {
    emit(SearchLoading());
    try {
      final results = await searchMovies(query);
      emit(SearchLoaded(results));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}
