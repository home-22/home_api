import 'package:flutter/material.dart';
import 'package:home_api/home/home_page.dart';

import 'package:home_api/widgets/app_large_text.dart';
import 'package:home_api/widgets/app_text.dart';

class WelcomeScreen extends StatefulWidget {
  static String routeName = '/home_page';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List images = [
    'slika1.jpg',
    'slika2.jpg',
    'slika3.jpg',
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            scrollDirection: Axis.vertical,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('img/' + images[index]),
                      fit: BoxFit.cover),
                ),
                child: Container(
                  margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppLargeText(text: 'Trips'),
                          AppText(
                            text: 'Mountain',
                            size: 30,
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: 250,
                            child: AppText(
                              text:
                                  'The beauties of the mountains in BiH are simply breathtaking. It is really difficult to say which one is from Bosnia and Herzegovina. the mountains are the most beautiful because each of them is unique and authentic in its own way, and represents a fantastic gem of nature.',
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          const SizedBox(height: 120),
                          GestureDetector(
                            onTap: () => Navigator.of(context).pushNamed(
                              HomePage.routeName,
                            ),
                            child: const CircleAvatar(
                              backgroundColor: Colors.redAccent,
                              child: Icon(
                                Icons.arrow_right_alt_sharp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Positioned(
            right: 15,
            top: 40,
            child: Column(
              children: List.generate(3, (indexDots) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  width: 8,
                  height: currentIndex == indexDots ? 25 : 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: currentIndex == indexDots
                        ? Colors.green
                        : Colors.white.withOpacity(0.9),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
