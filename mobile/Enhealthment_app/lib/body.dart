import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:Enhealthment_app/constants.dart';
import 'package:flutter/rendering.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  static final String uploadEndPoint =
      'http://164.90.146.236:8000/api/v1.0/images/';
  var _image;
  Future _getImageGallery() async {
    var image = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    setState(() {
      _image = image.path;

      _upload(_image);
    });
  }

  void _upload(File file) async {
    String fileName = file.path.split('/').last;

    FormData data = FormData.fromMap({
      "file": await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
    });

    Dio dio = new Dio();

    dio
        .post(uploadEndPoint, data: data)
        .then((response) => print(response))
        .catchError((error) => print(error));
  }

  Future _getImageCamera() async {
    var imagePicker = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = imagePicker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryBackgroundColor,
      body: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.1 - 27,
              decoration: BoxDecoration(
                gradient: kPrimaryGradientColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Center(
                child: FlatButton(
                  padding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.white,
                  textColor: kPrimaryColor,
                  onPressed: () {
                    _getImageGallery();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 38.0),
                    child: Text(
                      "Cargar desde Galería",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
