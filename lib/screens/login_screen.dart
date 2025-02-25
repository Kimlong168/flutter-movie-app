import 'package:flutter/material.dart';
import './home_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //     image: NetworkImage(
          //         'https://m.media-amazon.com/images/M/MV5BMzJiMzhiOWQtMDljZS00MjViLWEwMzUtNzIxMTBmZGNkOWExXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg'), // Your background image
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      color: Colors.blue,
                      alignment: Alignment.center,
                      width: 150,
                      child: Image.network(
                          'https://tse4.mm.bing.net/th?id=OIP.n78UGkpJrjcwNtnTCMtIdQHaEK&pid=Api&P=0&h=220')),
                  const SizedBox(height: 20),
                  Container(
                    // alignment: Alignment.center,
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text('Welcome back!',
                        style: TextStyle(fontSize: 24, color: Colors.white)),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: TextField(
                      style: const TextStyle(color: Colors.red),
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: const TextStyle(
                            color: Colors.red), // Label text color
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.blue, // Border color when enabled
                            width: 2.0,
                          ),
                          borderRadius:
                              BorderRadius.circular(10.0), // Rounded corners
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.red, // Border color when enabled
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(
                                255, 238, 52, 39), // Border color when focused
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: TextField(
                      style: const TextStyle(color: Colors.red),
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                            color: Colors.red), // Label text color
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.blue, // Border color when enabled
                            width: 2.0,
                          ),
                          borderRadius:
                              BorderRadius.circular(10.0), // Rounded corners
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.red, // Border color when enabled
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(
                                255, 238, 71, 59), // Border color when focused
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Forget password?',
                      style: TextStyle(
                        color: Colors.white,
                        // fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  HomePage()));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 240, 41, 27),
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(color: Colors.white, width: 1),
                        ),
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 60,
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
