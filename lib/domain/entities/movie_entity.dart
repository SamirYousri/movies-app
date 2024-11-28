class Movie {
  final String title;
  final String image;
  final String summary;
  final List<String> genres;
  final int runtime;
  final String premiereDate;

  Movie({
    required this.title,
    required this.image,
    required this.summary,
    required this.genres,
    required this.runtime,
    required this.premiereDate,
  });
}
