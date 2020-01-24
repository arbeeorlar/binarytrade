import 'package:flutter/material.dart';
import './screens/welcomescreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UI',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: SplashScreenPage(),
    );
  }
}

