import 'package:flutter/material.dart';
import 'package:jejuinfo/pages/home.dart';

void main() {
  runApp(const MaterialApp(
    title: 'JejuInfo',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Home();
  }
}
