// import 'package:animations/src/pages/animation_page.dart';
// import 'package:a nimations/src/pages/headers_pages.dart';
import 'package:animations/src/challenges/square_animate_page.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SquareAnimatePage()
      ),
    );
  }
}