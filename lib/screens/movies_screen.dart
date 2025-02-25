import 'package:flutter/material.dart';
import './detail_movie_screen.dart';
import './home_screen.dart';
import '../models/movie_model.dart';
import '../services/network_service.dart';

class MoviesPage extends StatefulWidget {
  String keyword;
  MoviesPage({Key? key, required this.keyword}) : super(key: key);
  // const MoviesPage({Key? key}) : super(key: key);
  @override
  _MoviePageState createState() => _MoviePageState(keyword);
}

class _MoviePageState extends State<MoviesPage> {
  final NetworkService networkService = NetworkService();
  String keyword;
  _MoviePageState(this.keyword);
  late Future<List<Movie>> futureMovies;
  // final TextEditingController _controller = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   futureMovies = Future.value([]);
  // }

  int _activeIndex = 0;

  void _setActiveIndex(int index) {
    setState(() {
      _activeIndex = index;
    });
  }

  void _setFilter(String text) {
    if (text == "All") {
      futureMovies = networkService.fetchMovies('spider man');
      return;
    }
    futureMovies = networkService.fetchMovies(text);
  }

  @override
  void initState() {
    super.initState();
    // Fetch a list of movies with a specific query (e.g., "spider")
    futureMovies = networkService.fetchMovies(keyword);
  }

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      "All",
      "Action",
      "Funny",
      "Magic",
      "Horror",
      "Science Fiction"
    ];

    // Mapping the list to widgets
    List<Widget> rowChildren = categories.asMap().entries.map((entry) {
      int index = entry.key;
      String item = entry.value;
      bool isActive = index == _activeIndex;
      return Row(
        children: [
          GestureDetector(
            onTap: () {
              _setActiveIndex(index);
              _setFilter(item);
            },
            child: Container(
              decoration: BoxDecoration(
                color: isActive ? Colors.red : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.red),
              ),
              padding: const EdgeInsets.all(10),
              child: Text(
                item,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      );
    }).toList();

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios_new, color: Colors.white)),
          title: const Text(
            'All Movies',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: FutureBuilder<List<Movie>>(
              future: futureMovies,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return Column(
                    children: [
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: rowChildren,
                          )),
                      const SizedBox(height: 15),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 7,
                          itemBuilder: (context, index) {
                            final movie = snapshot.data![index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailMovieScreen(
                                              title: movie.title,
                                              desc:
                                                  "Avengers: Endgame is a thrilling conclusion to the Marvel saga, where the Avengers unite for a final battle against Thanos to restore balance to the universe.",
                                              image: movie.imageUrl,
                                              subtitle: movie.year,
                                            )));
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Stack(children: [
                                    Container(
                                        height: 200,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[800],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: NetworkImage(movie.imageUrl),
                                            fit: BoxFit.cover,
                                          ),
                                        )),
                                    const Positioned(
                                        right: 10,
                                        bottom: 5,
                                        child: Row(
                                          children: [
                                            Icon(Icons.star,
                                                color: Color.fromARGB(
                                                    255, 220, 157, 10),
                                                size: 17),
                                            SizedBox(width: 5),
                                            Text('9.5',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 17)),
                                          ],
                                        ))
                                  ]),
                                  const SizedBox(height: 5),
                                  Text(
                                    movie.title,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 17),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    movie.year + ' ,Drama, Fantasy, Horror',
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 95, 94, 94),
                                        fontSize: 14),
                                  ),
                                  const SizedBox(height: 15),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Text('No movies found');
                }
              }),
        ));
  }
}
