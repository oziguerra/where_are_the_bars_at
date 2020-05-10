import 'package:flutter/material.dart';
import 'package:wherearethebarsat/screens/bar_list_screen.dart';
import 'package:wherearethebarsat/screens/loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoadingScreen(),
    );
  }
}
