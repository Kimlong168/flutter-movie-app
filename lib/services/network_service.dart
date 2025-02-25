// lib/network_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie_model.dart';

class NetworkService {
  final String apiKey = '846edab228msh6d91b8927f93c75p143fb9jsna3abe7637abf';
  final String apiHost = 'online-movie-database.p.rapidapi.com';

  Future<List<Movie>> fetchMovies(String query) async {
    final response = await http.get(
      Uri.parse('https://online-movie-database.p.rapidapi.com/auto-complete?q=$query'),
      headers: {
        'X-RapidAPI-Key': apiKey,
        'X-RapidAPI-Host': apiHost,
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<Movie> movies = (data['d'] as List)
          .map((item) => Movie.fromJson(item))
          .toList();
      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
