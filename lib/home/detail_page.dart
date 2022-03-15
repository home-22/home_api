import 'package:flutter/material.dart';
import 'package:home_api/home/home_page.dart';

import 'package:home_api/widgets/app_large_text.dart';
import 'package:home_api/widgets/app_text.dart';
import 'package:home_api/widgets/components/app_buttons.dart';

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  static const String routeName = '/home_page';
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                width: double.maxFinite,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('img/slika7.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 20,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed(HomePage.routeName2),
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 270,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                height: 350,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(
                          text: 'Yosemite',
                          color: Colors.black.withOpacity(0.9),
                        ),
                        AppLargeText(
                          text: '\$ 250',
                          color: Colors.blue,
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: Colors.blue),
                        const SizedBox(width: 5),
                        AppText(
                          text: 'BiH , Meadow',
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(Icons.star,
                                color: index < gottenStars
                                    ? Colors.amber
                                    : Colors.grey);
                          }),
                        ),
                        const SizedBox(width: 10),
                        AppText(
                          text: '(4.0)',
                          color: Colors.grey,
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    AppLargeText(
                      text: 'People',
                      color: Colors.black.withOpacity(0.7),
                      size: 20,
                    ),
                    const SizedBox(height: 5),
                    AppText(
                      text: 'Number of people in your group',
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      children: List.generate(5, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: AppButtons(
                              size: 40,
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.black,
                              backgroundColor: selectedIndex == index
                                  ? Colors.black
                                  : Colors.white,
                              borderColor: selectedIndex == index
                                  ? Colors.black
                                  : Colors.white,
                              text: (index + 1).toString(),
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 10),
                    AppLargeText(
                      text: 'Discription',
                      color: Colors.black.withOpacity(0.8),
                    ),
                    const SizedBox(height: 5),
                    AppText(
                        text:
                            'You must go for a travel. Tavelling helps get rid of pressure. Go to the mountains to see the nature.'),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 20,
              right: 10,
              child: Row(
                children: [
                  AppButtons(
                    size: 50,
                    color: Colors.amber,
                    backgroundColor: Colors.white,
                    borderColor: Colors.grey,
                    isIcon: true,
                    icon: Icons.favorite_border,
                  ),
                  const SizedBox(width: 150),
                  // Button(
                  //   isButton: true,
                  //  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.settings_phone_sharp,
                      color: Colors.amber,
                      size: 40,
                    ),
                  ),

                  AppText(
                    text: 'Book Trip Now',
                    size: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
