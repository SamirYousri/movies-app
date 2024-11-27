import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:movies_app/core/utils/constant.dart';
import 'package:movies_app/data/models/movie_model.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';

class MovieRemoteDatasource {
  final Dio dio;

  MovieRemoteDatasource(this.dio);

  // تهيئة Dio مع تجاوز تحقق SSL
  static Dio setupDio() {
    Dio dio = Dio();

    // تجاوز تحقق SSL
    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    return dio;
  }

  // استرجاع الأفلام
  Future<List<Movie>> fetchMovies() async {
    final dio = setupDio();
    final response = await dio.get('$baseUrl/search/shows?q=all');

    if (response.statusCode == 200) {
      final List data = response.data; // بيانات JSON من API
      return data.map((json) => MovieModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  // البحث عن الأفلام
  Future<List<Movie>> searchMovies(String query) async {
    final dio = setupDio();
    final response = await dio.get('$baseUrl/search/shows?q=$query');

    if (response.statusCode == 200) {
      final List data = response.data; // بيانات JSON من API
      return data.map((json) => MovieModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to search movies');
    }
  }
}
