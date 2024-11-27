import 'package:movies_app/domain/entities/movie_entity.dart';

import '../repositories/movie_repository.dart';

class SearchMoviesUseCase {
  final MovieRepository repository;

  SearchMoviesUseCase(this.repository);

  Future<List<MovieEntity>> call(String query) async {
    return await repository.searchMovies(query);
  }
}
