import 'package:flutter/material.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;
  final VoidCallback onTap;

  const MovieItem({
    super.key,
    required this.movie,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // التحقق من الرابط والتأكد من أنه رابط HTTP صالح
    String imageUrl = movie.image;

    // التحقق من أن الرابط يبدأ بـ "http://" أو "https://"
    bool isValidImageUrl = imageUrl.isNotEmpty && imageUrl.startsWith('http');

    return ListTile(
      leading: isValidImageUrl
          ? Image.network(imageUrl) // إذا كان الرابط صالحًا
          : Image.asset(
              'assets/images/tyson-moultrie-BQTHOGNHo08-unsplash.jpg'), // صورة محلية بديلة
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
