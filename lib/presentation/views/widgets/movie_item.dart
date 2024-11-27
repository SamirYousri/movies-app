import 'package:flutter/material.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';

class MovieItem extends StatelessWidget {
  final MovieEntity movie;
  final VoidCallback onTap;

  const MovieItem({
    super.key,
    required this.movie,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(movie.image),
      title: Text(movie.title),
      subtitle: Text(
        movie.summary,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: onTap,
    );
  }
}
