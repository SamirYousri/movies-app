import 'package:movies_app/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<List<Movie>> getMovies();
  Future<List<Movie>> searchMovies(String query);
}
