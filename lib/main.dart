import 'package:flutter/material.dart';
import 'package:smartfarm/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartFarm',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
