import 'package:flutter/material.dart';
import 'package:home_api/home/home_page.dart';
import 'package:home_api/screen/item_screen.dart';
import 'package:home_api/screen/search_screen.dart';

class NavigatorBarScreen extends StatefulWidget {
  const NavigatorBarScreen({Key? key}) : super(key: key);

  @override
  State<NavigatorBarScreen> createState() => _NavigatorBarScreenState();
}

class _NavigatorBarScreenState extends State<NavigatorBarScreen> {
  List pages = [
    const HomePage(),
    const Item(),
    const Search(),
  ];
  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.red,
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
            label: ('Profile'),
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
