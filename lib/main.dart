import 'package:flutter/material.dart';
// import 'package:share_feature/home_page.dart';
import 'package:share_feature/stateless_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Share Feature',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const HomePage(),
      home: StatelessHomePage(),
    );
  }
}