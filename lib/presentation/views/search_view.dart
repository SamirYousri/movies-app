import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/managers/search_cubit/search_cubit.dart';
import 'package:movies_app/presentation/managers/search_cubit/search_state.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Movies'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
              onSubmitted: (query) {
                context.read<SearchCubit>().searchMoviesByQuery(query);
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SearchLoaded) {
                  return ListView.builder(
                    itemCount: state.movies.length,
                    itemBuilder: (context, index) {
                      final movie = state.movies[index];
                      return ListTile(
                        leading: Image.network(
                          movie.image,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(movie.title),
                        subtitle: Text(
                          movie.summary,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/details',
                              arguments: movie);
                        },
                      );
                    },
                  );
                } else if (state is SearchError) {
                  return Center(child: Text('Error: ${state.message}'));
                } else {
                  return const Center(child: Text('Search for a movie.'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
