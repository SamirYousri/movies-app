import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/data/data_sources/movie_remote_data_source.dart';
import 'package:movies_app/data/repositories/movie_repository_impl.dart';
import 'package:movies_app/domain/use_case/get_movies_use_case.dart';
import 'package:movies_app/domain/use_case/search_movies_use_case.dart';
import 'package:movies_app/presentation/managers/home_cubit/home_cubit.dart';
import 'package:movies_app/presentation/managers/search_cubit/search_cubit.dart';
import 'package:movies_app/presentation/views/details_view.dart';
import 'package:movies_app/presentation/views/home_view.dart';
import 'package:movies_app/presentation/views/search_view.dart';
import 'package:movies_app/presentation/views/splash_view.dart';
import 'package:movies_app/presentation/views/widgets/bottom_navigation_view.dart';

void main() {
  final dio = Dio();
  final movieRemoteDatasource = MovieRemoteDatasource(dio);
  final movieRepository = MovieRepositoryImpl(movieRemoteDatasource);

  runApp(MyApp(
    homeCubit: HomeCubit(GetMovies(movieRepository)),
    searchCubit: SearchCubit(SearchMovies(movieRepository)),
  ));
}

class MyApp extends StatelessWidget {
  final HomeCubit homeCubit;
  final SearchCubit searchCubit;

  const MyApp({
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
        title: 'Movies App',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/BottomNavigation': (context) => const BottomNavigationScreen(),
          '/details': (context) => const DetailsScreen(),
          '/search': (context) => const SearchScreen(),
          '/home': (context) => const HomeScreen(),
        },
      ),
    );
  }
}
