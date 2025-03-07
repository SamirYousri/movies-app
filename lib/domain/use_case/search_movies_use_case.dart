import 'package:movies_app/domain/entities/movie_entity.dart';

import '../repositories/movie_repository.dart';

class SearchMovies {
  final MovieRepository repository;

  SearchMovies(this.repository);

  Future<List<Movie>> call(String query) async {
    return await repository.searchMovies(query);
  }
}
