import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPage();
}

class _NotificationPage extends State<NotificationPage> {
  //  _NotificationPage({super.key});
  // final show = false;
  bool show = true;

  void setShow() {
    setState(() {
      show = !show;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,
              color: Color.fromARGB(165, 255, 255, 255)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          GestureDetector(
            onTap: setShow,
            child: const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Read all',
                style: TextStyle(color: Color.fromARGB(165, 255, 255, 255)),
              ),
            ),
          )
        ],
        backgroundColor: Colors.black,
      ),
      body: Container(
          padding: const EdgeInsets.all(15),
          child: show
              ? ListView(children: [
                  NotificationRow(
                    title: 'Login Successful',
                    subtitle: 'You have logged in successfully!',
                    imgUrl:
                        'https://kimlongchann.online/static/media/kimlong.9d773125bee791169493.jpg',
                  ),
                  const SizedBox(height: 15),
                  NotificationRow(
                    title: 'New Movie',
                    subtitle: 'Advanger end game now released ',
                    imgUrl:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6a2BndMrNGrkwJQ1o2JZ_UaMaahRr4ENeKg&s',
                  ),
                  const SizedBox(height: 15),
                  NotificationRow(
                    title: 'New Movie',
                    subtitle: 'A new movie has been added to the platform',
                    imgUrl:
                        'https://m.media-amazon.com/images/M/MV5BMzJiMzhiOWQtMDljZS00MjViLWEwMzUtNzIxMTBmZGNkOWExXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg',
                  ),
                ])
              : const Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Icon(
                        Icons.notifications,
                        color: Color.fromARGB(255, 231, 29, 29),
                        size: 50,
                      ),
                      SizedBox(height: 15),
                      Text(
                        'No Notifications Yet!',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'When you get a notification, you will see it here.',
                        style: TextStyle(
                            color: Color.fromARGB(155, 255, 255, 255),
                            fontSize: 13),
                      ),
                    ]))),
    );
  }
}

class NotificationRow extends StatelessWidget {
  String title;
  String subtitle;
  String imgUrl;
  NotificationRow(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.imgUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                image: NetworkImage(imgUrl), // Your image here
                fit: BoxFit.cover,
              )),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 17),
            ),
            Text(
              subtitle,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
