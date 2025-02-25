import 'package:flutter/material.dart';
import './home_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                          height: 50,
                          width: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              'https://kimlongchann.netlify.app/static/media/kimlong.9d773125bee791169493.jpg',
                              fit: BoxFit.cover,
                            ),
                          )),
                      const SizedBox(
                        width: 15,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('CHANN KIMLONG',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          Text('Edit Profile',
                              style: TextStyle(
                                  color: Color.fromARGB(123, 255, 255, 255),
                                  fontSize: 13)),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Back',
                        style: TextStyle(
                            color: Color.fromARGB(255, 238, 52, 39),
                            fontSize: 15),
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 238, 52, 39),
                    borderRadius: BorderRadius.circular(10)),
                child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text('12',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          Text('Watched',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13)),
                        ],
                      ),
                      Column(
                        children: [
                          Text('4',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          Text('Favorites',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13)),
                        ],
                      ),
                      Column(
                        children: [
                          Text('2',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          Text('Rated',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13)),
                        ],
                      )
                    ]),
              ),
              const SizedBox(
                height: 20,
              ),
              _buildListTile(),
              const Expanded(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text('Version 1.0.0',
                          style: TextStyle(
                              color: Color.fromARGB(142, 255, 255, 255),
                              fontSize: 14)))),
            ],
          ),
        ));
  }

  Widget _buildListTile() {
    return const Column(children: [
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Row(
          children: [
            Icon(Icons.settings, color: Colors.white),
            SizedBox(
              width: 10,
            ),
            Text('Settings',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        trailing: Icon(Icons.arrow_forward_ios,
            size: 14, color: Color.fromARGB(142, 255, 255, 255)),
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Row(
          children: [
            Icon(Icons.star, color: Colors.white),
            SizedBox(
              width: 10,
            ),
            Text('Rating & Reviews',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        trailing: Icon(Icons.arrow_forward_ios,
            size: 14, color: Color.fromARGB(142, 255, 255, 255)),
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Row(
          children: [
            Icon(Icons.support_agent, color: Colors.white),
            SizedBox(
              width: 10,
            ),
            Text('Customer Support',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        trailing: Icon(Icons.arrow_forward_ios,
            size: 14, color: Color.fromARGB(142, 255, 255, 255)),
      ),
      ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Row(
          children: [
            Icon(Icons.logout, color: Colors.white),
            SizedBox(
              width: 10,
            ),
            Text('logout',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        trailing: Icon(Icons.arrow_forward_ios,
            size: 14, color: Color.fromARGB(142, 255, 255, 255)),
      ),
    ]);
  }
}
