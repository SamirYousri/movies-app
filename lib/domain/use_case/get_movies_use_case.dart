import 'package:movies_app/domain/entities/movie_entity.dart';

import '../repositories/movie_repository.dart';

class GetMoviesUseCase {
  final MovieRepository repository;

  GetMoviesUseCase(this.repository);

  Future<List<MovieEntity>> call() async {
    return await repository.getMovies();
  }
}
