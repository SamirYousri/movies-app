import 'package:movies_app/domain/entities/movie_entity.dart';

import '../repositories/movie_repository.dart';

class GetMovies {
  final MovieRepository repository;

  GetMovies(this.repository);

  Future<List<Movie>> call() async {
    return await repository.getMovies();
  }
}
