import 'package:movies_app/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>> getMovies();
  Future<List<MovieEntity>> searchMovies(String query);
}
