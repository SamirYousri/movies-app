import 'package:movies_app/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  MovieModel({
    required String title,
    required String image,
    required String summary,
  }) : super(title: title, image: image, summary: summary);

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['show']['name'] ?? 'Unknown',
      image: json['show']['image']?['medium'] ?? '',
      summary: json['show']['summary'] ?? '',
    );
  }
}
