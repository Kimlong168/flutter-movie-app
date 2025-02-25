import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './login_screen.dart';

class GuestPage extends StatelessWidget {
  const GuestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://m.media-amazon.com/images/M/MV5BMzJiMzhiOWQtMDljZS00MjViLWEwMzUtNzIxMTBmZGNkOWExXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg'), // Your background image
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 15, bottom: 30, top: 15),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Watch your favorite movies and TV shows for free on only one plateform. You acn watch it anytime and anywhere.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(17),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 219, 33, 20),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(214, 16, 15, 15),
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          'Continue with Google',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                      const Positioned(
                        left: 20,
                        child: FaIcon(
                          FontAwesomeIcons.google,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ))
            ]),
      ),
    ));
  }
}
