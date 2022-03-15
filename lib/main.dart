import 'package:flutter/material.dart';
import 'package:home_api/home/detail_page.dart';

import 'package:home_api/home/home_page.dart';

import 'package:home_api/screen/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Api',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const WelcomeScreen(),
      routes: {
        HomePage.routeName: (_) => const HomePage(),
        DetailPage.routeName: (_) => const DetailPage(),
        HomePage.routeName2: (_) => const HomePage(),
      },
    );
  }
}
