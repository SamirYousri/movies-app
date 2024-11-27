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

  // تحويل البيانات من JSON إلى MovieModel
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['show']['name'] ?? 'Unknown',
      image: json['show']['image']?['medium'] ??
          '', // إذا لم توجد الصورة، استخدم رابط فارغ
      summary: json['show']['summary'] ?? 'No summary available',
      genres: List<String>.from(
          json['show']['genres'] ?? []), // تحويل genres إلى قائمة نصوص
      runtime: json['show']['runtime'] ?? 0, // إذا لم توجد مدة العرض، استخدم 0
      premiereDate: json['show']['premiered'] ??
          'Unknown', // إذا لم يوجد تاريخ العرض، استخدم 'Unknown'
    );
  }
}
