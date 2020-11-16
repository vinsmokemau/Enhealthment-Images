import 'dart:async';
import 'package:Enhealthment_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:Enhealthment_app/menu.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<Timer> loadData() async {
    // return Timer(Duration(seconds: 1, milliseconds: 618, microseconds: 34),
    //     onDoneLoading);
    _uploadImage();
    return Timer(Duration(seconds: 1, milliseconds: 618, microseconds: 33),
        onDoneLoading);
  }

  Future<void> _uploadImage() async {}

  onDoneLoading() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Menu(),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: kPrimaryGradientColor),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icons/camara_rayoz.png',
                  width: MediaQuery.of(context).size.width * 0.7),
              Text(
                "Imhealthment",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 30),
              )
            ],
          ),
        ),
      ),
    );
  }
}
