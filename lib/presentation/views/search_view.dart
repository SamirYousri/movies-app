import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:html/parser.dart'; // لتحليل النصوص وإزالة العلامات HTML
import 'package:movies_app/presentation/managers/search_cubit/search_cubit.dart';
import 'package:movies_app/presentation/managers/search_cubit/search_state.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Movies'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              style: const TextStyle(color: Colors.black), // لون النص أسود
              decoration: InputDecoration(
                hintText: 'Search movies...',
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    context
                        .read<SearchCubit>()
                        .searchMovies(searchController.text);
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SearchLoaded) {
                  if (state.movies.isEmpty) {
                    return const Center(child: Text('No movies found.'));
                  }
                  return ListView.builder(
                    itemCount: state.movies.length,
                    itemBuilder: (context, index) {
                      final movie = state.movies[index];

                      final cleanSummary =
                          parse(movie.summary).documentElement?.text ?? '';
                      return ListTile(
                        leading: Image.network(
                          movie.image,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset(
                                  'assets/images/pexels-cottonbro-3945313.jpg'),
                        ),
                        title: Text(
                          movie.title,
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          cleanSummary,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/details',
                            arguments: movie,
                          );
                        },
                      );
                    },
                  );
                } else if (state is SearchError) {
                  return Center(child: Text('Error: ${state.message}'));
                } else {
                  return const Center(
                    child: Text('Start searching by typing a movie name.'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
