import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/data_sources/movie_remote_data_source.dart';
import 'package:movies_app/domain/use_case/get_movies_use_case.dart';
import 'package:movies_app/domain/use_case/search_movies_use_case.dart';
import 'package:movies_app/presentation/managers/home_cubit/home_cubit.dart';
import 'package:movies_app/presentation/managers/search_cubit/search_cubit.dart';
import 'package:movies_app/presentation/views/details_view.dart';
import 'package:movies_app/presentation/views/home_view.dart';
import 'package:movies_app/presentation/views/search_view.dart';
import 'package:movies_app/presentation/views/splash_view.dart';

import 'data/repositories/movie_repository_impl.dart';

import 'package:http/http.dart' as http;

void main() {
  final remoteDatasource = MovieRemoteDatasource(http.Client());
  final movieRepository = MovieRepositoryImpl(remoteDatasource);

  runApp(MoviesApp(
    homeCubit: HomeCubit(GetMoviesUseCase(movieRepository)),
    searchCubit: SearchCubit(SearchMoviesUseCase(movieRepository)),
  ));
}

class MoviesApp extends StatelessWidget {
  final HomeCubit homeCubit;
  final SearchCubit searchCubit;

  const MoviesApp({
    super.key,
    required this.homeCubit,
    required this.searchCubit,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => homeCubit..fetchMovies()),
        BlocProvider(create: (_) => searchCubit),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => const SplashScreen(),
          '/home': (context) => const HomeScreen(),
          '/search': (context) => const SearchScreen(),
          '/details': (context) => const DetailsScreen(),
        },
      ),
    );
  }
}
