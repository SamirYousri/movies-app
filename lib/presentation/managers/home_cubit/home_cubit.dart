import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/domain/use_case/get_movies_use_case.dart';
import 'package:movies_app/presentation/managers/home_cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetMoviesUseCase getMovies;

  HomeCubit(this.getMovies) : super(HomeInitial());

  void fetchMovies() async {
    emit(HomeLoading());
    try {
      final movies = await getMovies();
      emit(HomeLoaded(movies));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
