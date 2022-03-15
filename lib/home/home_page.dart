import 'package:flutter/material.dart';
import 'package:home_api/home/detail_page.dart';
import 'package:home_api/screen/profile_screen.dart';
import 'package:home_api/screen/search_screen.dart';
import 'package:home_api/widgets/app_large_text.dart';
import 'package:home_api/widgets/app_text.dart';

import '../screen/item_screen.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'detail/_page';
  static const String routeName2 = 'home/_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    'slika25.png': 'Sledding',
    'slika23.png': 'Hiking',
    'slika22.png': 'Balloning',
    'slika24.png': 'Climbing',
  };

  List pages = [
    const HomePage(),
    const Item(),
    const Search(),
    const Profile(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      // body: pages[cuttentIndex],
      body: currentIndex != 0
          ? pages[currentIndex]
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 13),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.menu,
                        size: 30,
                        color: Colors.grey,
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      Container(
                        child: IconButton(
                            onPressed: () => Navigator.of(context)
                                .pushNamed(DetailPage.routeName),
                            icon: const Icon(
                              Icons.navigate_next,
                              color: Colors.black,
                            )),
                        margin: const EdgeInsets.only(right: 20, top: 15),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue.withOpacity(0.7),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: AppLargeText(text: 'Bosna and Hercegovina'),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      //  labelPadding: const EdgeInsets.only(left: 0, right: 0),
                      controller: _tabController,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator:
                          CircleTabIndicator(color: Colors.blue, radius: 4),
                      tabs: const [
                        Tab(text: 'Places'),
                        Tab(text: 'Inspiration'),
                        Tab(text: 'Emotions'),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  //padding: const EdgeInsets.only(left: 15),
                  height: 250,
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 15, top: 10),
                            width: 200,
                            height: 290,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: const DecorationImage(
                                  image: AssetImage('img/slika4.jpg'),
                                  fit: BoxFit.cover),
                            ),
                          );
                        },
                      ),
                      const Text('There'),
                      const Text('Bye'),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppLargeText(text: 'Explore more', size: 22),
                      AppText(text: 'Sell all', color: Colors.grey),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 110,
                  width: double.maxFinite,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (_, index) {
                      return Container(
                        margin: const EdgeInsets.only(left: 25),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 25),
                              width: 75,
                              height: 75,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: AssetImage(
                                        'img/' + images.keys.elementAt(index),
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              child: AppText(
                                text: images.values.elementAt(index),
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey.withOpacity(0.6),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            label: ('Home'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: ('Bar'),
            icon: Icon(
              Icons.bar_chart_sharp,
            ),
          ),
          BottomNavigationBarItem(
            label: ('Search'),
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: ('My'),
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }

  void onTap(int index) {
    setState(() => currentIndex = index);
  }
}

// ignore: must_be_immutable
class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
