import '../../domain/entities/movie_entity.dart';

class MovieModel extends Movie {
  MovieModel({
    required String title,
    required String image,
    required String summary,
    required List<String> genres,
    required int runtime,
    required String premiereDate,
  }) : super(
          title: title,
          image: image,
          summary: summary,
          genres: genres,
          runtime: runtime,
          premiereDate: premiereDate,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['show']['name'] ?? 'Unknown',
      image: json['show']['image']?['medium'] ?? '',
      summary: json['show']['summary'] ?? 'No summary available',
      genres: List<String>.from(json['show']['genres'] ?? []),
      runtime: json['show']['runtime'] ?? 0,
      premiereDate: json['show']['premiered'] ?? 'Unknown',
    );
  }
}
