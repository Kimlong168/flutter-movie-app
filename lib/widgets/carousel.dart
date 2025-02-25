import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(bottom: 5.0),
      child: CarouselSlider(
        options: CarouselOptions(
          // height: 90.0,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(milliseconds: 1000),
          viewportFraction: 0.8,
        ),
        items: [
          'https://tse1.mm.bing.net/th?id=OIP.gAaYewsEGtpY3CwPYD-cpwHaDt&pid=Api&P=0&h=220',
          'https://tse4.mm.bing.net/th?id=OIP.RV3pSiNjAe05EKTqjlvepgHaDm&pid=Api&P=0&h=220',
          'https://tse3.mm.bing.net/th?id=OIP.uc2suzwXp1OuP9E7knnuRAAAAA&pid=Api&P=0&h=220',
          'https://tse1.mm.bing.net/th?id=OIP.P1x8DIQ--QOIImQPeoxyAgAAAA&pid=Api&P=0&h=220',
        ].map((item) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                // margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 158, 226, 203),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    item,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
