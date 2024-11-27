import 'package:movies_app/domain/entities/movie_entity.dart';

abstract class HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Movie> movies;
  HomeLoaded(this.movies);
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
