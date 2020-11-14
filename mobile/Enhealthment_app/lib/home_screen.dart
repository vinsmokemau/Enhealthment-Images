import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:Enhealthment_app/constants.dart';
import 'package:Enhealthment_app/body.dart';
import 'package:Enhealthment_app/UploadImage.dart';
import 'package:Enhealthment_app/splash.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SplashScreen(),
      backgroundColor: kPrimaryBackgroundColor,
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        title: Text(
          "Enhealthment Images",
        ),
        backgroundColor: Color(0xff326eaf),
        elevation: 0,
        leading: Image.asset("assets/icons/camara_blanca.png"));
  }
}
