import 'package:flutter/material.dart';
import 'package:music_app/home.dart';
import 'package:music_app/music.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
