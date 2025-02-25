// lib/movie_model.dart

class Movie {
  final String id;
  final String title;
  final String imageUrl;
  final String year;

  Movie({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.year,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] ?? '',
      title: json['l'] ?? 'No title available',
      imageUrl: json['i'] != null
          ? json['i']['imageUrl']
          : 'https://via.placeholder.com/150',
      year: json['y']?.toString() ?? 'Unknown',
    );
  }
}
