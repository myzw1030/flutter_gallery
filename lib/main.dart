import 'package:flutter/material.dart';
import 'package:flutter_gallery/pages/home_page.dart';

void main() {
  runApp(const GalleryApp());
}

class GalleryApp extends StatelessWidget {
  const GalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFE6EBEB),
      ),
      // theme: GalleryThemeData.lightThemeData,
      home: const HomePage(),
    );
  }
}
