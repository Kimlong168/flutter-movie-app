import 'package:flutter/material.dart';
import '../services/movie_detail_network_service.dart';
import '../models/movie_detail_model.dart';

class MovieDetailPage extends StatefulWidget {
  final String movieId;

  MovieDetailPage({required this.movieId});

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final NetworkService networkService = NetworkService();
  late Future<MovieDetail> futureMovieDetail;

  @override
  void initState() {
    super.initState();
    futureMovieDetail = networkService.fetchMovieDetail(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Detail'),
      ),
      body: FutureBuilder<MovieDetail>(
        future: futureMovieDetail,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final movie = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(movie.imageUrl),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text('Release Date: ${movie.releaseDate}'),
                        Text('Rating: ${movie.rating}'),
                        Text('Genre: ${movie.genre}'),
                        SizedBox(height: 16),
                        Text(
                          movie.plotOutline,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 16),
                        Text('Author: ${movie.author}'),
                        Text(movie.plotSummary),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: Text('No movie details available'));
          }
        },
      ),
    );
  }
}
