import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/core/utils/constant.dart';
import '../models/movie_model.dart';

class MovieRemoteDatasource {
  final http.Client client;

  MovieRemoteDatasource(this.client);

  Future<List<MovieModel>> fetchMovies() async {
    final response = await client.get(Uri.parse('$baseUrl/search/shows?q=all'));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((json) => MovieModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<MovieModel>> searchMovies(String query) async {
    final response =
        await client.get(Uri.parse('$baseUrl/search/shows?q=$query'));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((json) => MovieModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to search movies');
    }
  }
}
