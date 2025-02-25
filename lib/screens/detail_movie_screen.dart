import 'package:flutter/material.dart';
import 'package:inner_shadow_widget/inner_shadow_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './home_screen.dart';

class DetailMovieScreen extends StatelessWidget {
  String image;
  String desc;
  String title;
  String subtitle;

  // const DetailMovieScreen({super.key} );
  DetailMovieScreen(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.desc,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.black,
      child: Column(
        children: [
          Expanded(
            child: Stack(children: [
              InnerShadow(
                  color: Colors.black.withOpacity(0.8),
                  offset: const Offset(0, 30),
                  blur: 10,
                  child: Container(
                    width: double.infinity,
                    height: 400,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.fill,
                      ),
                    ),
                  )),
              Positioned(
                top: 50,
                left: 15,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const CircleAvatar(
                    backgroundColor: Color.fromARGB(160, 0, 0, 0),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
              const Positioned(
                  bottom: 10,
                  left: 15,
                  child: Text(
                    'SERIES',
                    style: TextStyle(color: Colors.red),
                  )),
            ]),
          ),
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ListTile(
                //   title: "dfdf",
                //   subTitle:"dfdfdf",
                //   icon:
                // )
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(title,
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Text('$subtitle, Action, Adventure, Drama',
                        style: const TextStyle(
                            color: Color.fromARGB(129, 255, 255, 255),
                            fontSize: 13)),
                  ],
                ),
                const FaIcon(FontAwesomeIcons.bookmark, color: Colors.red)
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: Text(
              desc,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          Container(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(7),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(121, 43, 43, 43),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Text(
                      '16+',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.all(7),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(121, 43, 43, 43),
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      subtitle,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(121, 43, 43, 43),
                          borderRadius: BorderRadius.circular(15)),
                      child: const Row(
                        children: [
                          Icon(Icons.star,
                              color: Color.fromARGB(255, 248, 164, 8),
                              size: 15),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '8.8',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(121, 43, 43, 43),
                          borderRadius: BorderRadius.circular(15)),
                      child: const Row(
                        children: [
                          Icon(Icons.watch_later,
                              color: Color.fromARGB(255, 248, 164, 8),
                              size: 15),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '44-49min',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      )),
                ],
              )),
          Container(
              padding: const EdgeInsets.all(15),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(17)),
                    child: const Text(
                      'Watch now',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                  const Positioned(
                      left: 20,
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      ))
                ],
              ))
        ],
      ),
    ));
  }
}
