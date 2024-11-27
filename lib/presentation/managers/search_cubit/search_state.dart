import 'package:movies_app/domain/entities/movie_entity.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<MovieEntity> movies;
  SearchLoaded(this.movies);
}

class SearchError extends SearchState {
  final String message;
  SearchError(this.message);
}
