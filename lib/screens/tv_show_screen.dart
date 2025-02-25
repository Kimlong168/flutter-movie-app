import 'package:flutter/material.dart';
import './home_screen.dart';
import "./detail_movie_screen.dart";

class TvShowpage extends StatelessWidget {
  const TvShowpage({super.key});

  @override
  Widget build(BuildContext context) {
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
          'All Tv Shows',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 8),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of items per row
                  crossAxisSpacing: 15.0, // Space between columns
                  mainAxisSpacing: 15.0, // Space between rows
                  childAspectRatio: 1.0, // Aspect ratio of each item
                ),
                itemCount: 15, // Number of items in the grid
                itemBuilder: (context, index) {
                  final List<String> imageUrls = [
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6a2BndMrNGrkwJQ1o2JZ_UaMaahRr4ENeKg&s',
                    'https://s.yimg.com/fz/api/res/1.2/xTvcdoii_dn5oU4l4kResA--~C/YXBwaWQ9c3JjaGRkO2ZpPWZpbGw7Zm9ybWF0PXdlYnA7aD0zODA7cHhvZmY9NTA7cHlvZmY9MDtxPTgwO3c9MjQw/https://s.yimg.com/zb/imgv1/a1702852-0829-30d8-9711-205b0e972f0b/t_1024x1024.cf.webp',
                    'https://tse2.mm.bing.net/th?id=OIP.paTd1axYN0qlnCcYK7DykQAAAA&pid=Api&P=0&h=220',
                    'https://tse3.mm.bing.net/th?id=OIP.EaQmcEGG7rD94N6eiAM-3gHaK-&pid=Api&P=0&h=220',
                    'https://tse3.mm.bing.net/th?id=OIF.x6yshJgfW7W7aplFQk45lg&pid=Api&P=0&h=220',
                    'https://tse3.mm.bing.net/th?id=OIP.SHh1Soy0LEcGolNXRXHrjQAAAA&pid=Api&P=0&h=220',
                    'https://via.placeholder.com/180',
                    'https://via.placeholder.com/180',
                    'https://via.placeholder.com/180',
                    'https://via.placeholder.com/180',
                    'https://via.placeholder.com/180',
                    'https://via.placeholder.com/180',
                    'https://via.placeholder.com/180',
                    'https://via.placeholder.com/180',
                    'https://via.placeholder.com/180',
                  ];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailMovieScreen(
                                    title: "Kongfu Panda",
                                    desc:
                                        "Kongfu Panda is a thrilling conclusion to the Marvel saga, where the Avengers unite for a final battle against Thanos to restore balance to the universe.",
                                    image: imageUrls[index],
                                    subtitle: '2020',
                                  )));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(122, 231, 29, 15),
                              width: 1),
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(0, 231, 29, 15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 125,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  image: DecorationImage(
                                    image: NetworkImage(imageUrls[index]
                                            .isNotEmpty
                                        ? imageUrls[index]
                                        : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6a2BndMrNGrkwJQ1o2JZ_UaMaahRr4ENeKg&s'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const Positioned(
                                right: 10,
                                top: 5,
                                child: Icon(Icons.favorite_outline_rounded,
                                    color: Color.fromARGB(255, 228, 18, 3)),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Padding(
                              padding: EdgeInsets.only(left: 8.0, right: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('TV Show Title',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                  Icon(
                                    Icons.play_arrow,
                                    color: Color.fromARGB(255, 228, 18, 3),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                  );
                },
              ))
            ]),
      ),
    );
  }
}
