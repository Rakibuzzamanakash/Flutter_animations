import 'package:flutter/material.dart';
import 'package:flutter_animation/Example1/example_1.dart';
import 'package:flutter_animation/example3/example_3.dart';

import 'Example2/example_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white
      ),
      home: Example3(),
    );
  }
}


