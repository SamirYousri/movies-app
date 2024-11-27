import 'package:movies_app/data/data_sources/movie_remote_data_source.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import '../../domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDatasource remoteDatasource;

  MovieRepositoryImpl(this.remoteDatasource);

  @override
  Future<List<MovieEntity>> getMovies() async {
    return await remoteDatasource.fetchMovies();
  }

  @override
  Future<List<MovieEntity>> searchMovies(String query) async {
    return await remoteDatasource.searchMovies(query);
  }
}
