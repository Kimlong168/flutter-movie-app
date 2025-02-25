import 'package:flutter/material.dart';
import '../widgets/carousel.dart';
import './detail_movie_screen.dart';
import './movies_screen.dart';
import './tv_show_screen.dart';
import './notification_screen.dart';
import './profile_screen.dart';

import '../services/network_service.dart';
import '../models/movie_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NetworkService networkService = NetworkService();
  late Future<List<Movie>> futureMovies;
  final TextEditingController _controller = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   futureMovies = Future.value([]);
  // }

  @override
  void initState() {
    super.initState();
    // Fetch a list of movies with a specific query (e.g., "spider")
    futureMovies = networkService.fetchMovies('spider man');
  }
 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
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
                  return Stack(children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const ProfilePage()));
                                      },
                                      child: SizedBox(
                                          height: 40,
                                          width: 40,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: Image.network(
                                                  'https://kimlongchann.netlify.app/static/media/kimlong.9d773125bee791169493.jpg',
                                              fit: BoxFit.cover,
                                            ),
                                          )),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Hello Kimlong',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17),
                                        ),
                                        Text(
                                          'Enjoy your favorite movie',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  197, 124, 123, 123),
                                              fontSize: 13),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const NotificationPage()));
                                  },
                                  child: const Icon(Icons.notifications,
                                      color: Colors.white),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 26,
                            ),
                            Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                TextField(
                                  controller: _controller,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(
                                        left: 45,
                                        top: 15,
                                        bottom: 15,
                                        right: 15),
                                    hintText: 'Search movies...',
                                    hintStyle: const TextStyle(
                                        fontSize: 15,
                                        color:
                                            Color.fromARGB(127, 255, 255, 255)),
                                    fillColor:
                                        const Color.fromARGB(184, 43, 43, 43),
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors
                                              .transparent, // Border color when enabled
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(13)),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors
                                            .transparent, // Border color when enabled
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors
                                            .transparent, // Border color when focused
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                  ),
                                  onSubmitted: (value) {
                                   
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MoviesPage(
                                                  keyword: value,
                                                )));
                                  },
                                ),
                                Positioned(
                                  left: 15,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MoviesPage(
                                                    keyword: _controller.text,
                                                  )));
                                    },
                                    child: const Icon(Icons.search,
                                        color:
                                            Color.fromARGB(127, 255, 255, 255)),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 26,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Popular Movies',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MoviesPage(
                                                    keyword: 'spider man',
                                                  )));
                                    },
                                    child: const Text(
                                      'View all',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 238, 52, 39),
                                          fontSize: 15),
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 250,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    final movie = snapshot.data![index];
                                    return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailMovieScreen(
                                                        title: movie.title,
                                                        desc:
                                                            "Avengers: Endgame is a thrilling conclusion to the Marvel saga, where the Avengers unite for a final battle against Thanos to restore balance to the universe.",
                                                        image: movie.imageUrl,
                                                        subtitle: movie.year,
                                                      )));
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  right: 15),
                                              width: 265,
                                              height: 170,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.network(
                                                  movie.imageUrl,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              width: 265,
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: Text(
                                                movie.title,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 17),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              movie.year +
                                                  ', Action, Adventure, Drama',
                                              style: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 95, 94, 94),
                                                  fontSize: 14),
                                            )
                                          ],
                                        ));
                                  }),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'TV Shows',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const TvShowpage()));
                                  },
                                  child: const Text(
                                    'View all',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 238, 52, 39),
                                        fontSize: 15),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 226,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    final List imageUrl = [
                                      'https://m.media-amazon.com/images/M/MV5BMzJiMzhiOWQtMDljZS00MjViLWEwMzUtNzIxMTBmZGNkOWExXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg',
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6a2BndMrNGrkwJQ1o2JZ_UaMaahRr4ENeKg&s',
                                      'https://tse2.mm.bing.net/th?id=OIP.paTd1axYN0qlnCcYK7DykQAAAA&pid=Api&P=0&h=220',
                                      'https://tse3.mm.bing.net/th?id=OIP.EaQmcEGG7rD94N6eiAM-3gHaK-&pid=Api&P=0&h=220',
                                      'https://tse3.mm.bing.net/th?id=OIF.x6yshJgfW7W7aplFQk45lg&pid=Api&P=0&h=220',
                                      'https://tse3.mm.bing.net/th?id=OIP.SHh1Soy0LEcGolNXRXHrjQAAAA&pid=Api&P=0&h=220',
                                    ];
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailMovieScreen(
                                                      title: "Kongfu Panda",
                                                      desc:
                                                          "Kongfu Panda is a thrilling conclusion to the Marvel saga, where the Avengers unite for a final battle against Thanos to restore balance to the universe.",
                                                      image: imageUrl[index],
                                                      subtitle: '2024',
                                                    )));
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                right: 15),
                                            width: 126,
                                            height: 126,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.network(
                                                imageUrl[index],
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Text(
                                            'Movie Title',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 17),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text(
                                            'Movie Description',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 95, 94, 94),
                                                fontSize: 14),
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.only(bottom: 20),
                              child: const Text('Up coming movies',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17)),
                            ),
                            SizedBox(
                              height: 150,
                              child: MyCarousel(),
                            ),
                            const SizedBox(
                              height: 80,
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 60,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 207, 32, 19),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(28)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Icon(Icons.home,
                                    color: Colors.white, size: 26),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MoviesPage(
                                                keyword: 'iron  man')));
                                  },
                                  child: const Icon(Icons.movie_filter_outlined,
                                      color: Colors.white, size: 26),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const TvShowpage()));
                                  },
                                  child: const Icon(
                                      Icons.favorite_border_outlined,
                                      color: Colors.white,
                                      size: 26),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ProfilePage()));
                                  },
                                  child: const Icon(Icons.person_2_outlined,
                                      color: Colors.white, size: 26),
                                )
                              ],
                            ),
                          ),
                        ))
                  ]);
                } else {
                  return const Text('No movies found');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
