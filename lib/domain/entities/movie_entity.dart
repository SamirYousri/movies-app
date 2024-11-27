class Movie {
  final String title;
  final String image;
  final String summary;
  final List<String> genres; // قائمة بالأنواع
  final int runtime; // مدة العرض
  final String premiereDate; // تاريخ العرض الأول

  Movie({
    required this.title,
    required this.image,
    required this.summary,
    required this.genres,
    required this.runtime,
    required this.premiereDate,
  });
}
