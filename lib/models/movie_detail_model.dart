// lib/movie_detail_model.dart

class MovieDetail {
  final String title;
  final String imageUrl;
  final String plotOutline;
  final String releaseDate;
  final double rating;
  final String genre;
  final String author;
  final String plotSummary;

  MovieDetail({
    required this.title,
    required this.imageUrl,
    required this.plotOutline,
    required this.releaseDate,
    required this.rating,
    required this.genre,
    required this.author,
    required this.plotSummary,
  });

  factory MovieDetail.fromJson(Map<String, dynamic> json) {
    return MovieDetail(
      title: json['title']['title'] ?? 'No title available',
      imageUrl: json['title']['image']['url'] ?? 'https://via.placeholder.com/150',
      plotOutline: json['plotOutline']['text'] ?? 'No plot outline available',
      releaseDate: json['releaseDate'] ?? 'Unknown',
      rating: (json['ratings']['rating'] ?? 0.0).toDouble(),
      genre: (json['genres'] != null && json['genres'].isNotEmpty) ? json['genres'][0] : 'Unknown',
      author: json['plotSummary']['author'] ?? 'Unknown',
      plotSummary: json['plotSummary']['text'] ?? 'No plot summary available',
    );
  }
}
