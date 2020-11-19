import 'package:Enhealthment_app/splash.dart';
import 'package:flutter/material.dart';
import 'package:Enhealthment_app/UploadImage.dart';
import 'package:Enhealthment_app/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Imhealthment',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
