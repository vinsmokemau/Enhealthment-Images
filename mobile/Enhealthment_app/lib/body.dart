import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:Enhealthment_app/constants.dart';
import 'package:flutter/rendering.dart';
import 'package:Enhealthment_app/zoom_image.dart';
import 'package:Enhealthment_app/zoom_methods.dart';
import 'Enhancement.dart';

Enhancement actual_url;

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String status = '';
  String base64Image;
  File tmpFile;
  String errMessage = 'Error Uploading Image';

  static final String uploadEndPoint =
      'http://164.90.146.236:8000/api/v1.0/images/';
  var _image;
  var img;

  Enhancement enhancements_images;

  Future _getImageGallery() async {
    var image = await ImagePicker().getImage(
        source: ImageSource.gallery,
        imageQuality: 100, // <- Reduce Image quality
        maxHeight: 500, // <- reduce the image size
        maxWidth: 500);
    if (image != null) {
      setState(() {
        img = image;
        _image = image.path;
        File tmpImage = File(_image);
        _upload(tmpImage);
      });
    }
  }

  Future<File> _getImageCamera() async {
    var image = await ImagePicker().getImage(
        source: ImageSource.camera,
        imageQuality: 100, // <- Reduce Image quality
        maxHeight: 500, // <- reduce the image size
        maxWidth: 500);
    setState(() {
      _image = image.path;
      File tmpImage = File(_image);
      _upload(tmpImage);
    });
  }

  void _upload(File file) async {
    String fileName = file.path.split('/').last;

    FormData data = FormData.fromMap({
      "name": fileName,
      "image": await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
    });

    Dio dio = new Dio();

    dio.post(uploadEndPoint, data: data).then((response) {
      print(response);
      enhancements_images = Enhancement.fromJson(response.data);
      print(enhancements_images.id);
      print(enhancements_images.name);
      print(enhancements_images.image);
      print(enhancements_images.enhancements);
      actual_url = enhancements_images;
      print(actual_url);
      setState(() {
        actual_url = actual_url;
      });
    }).catchError((error) => print(error));
  }

  // Widget showImage() {
  //   return FutureBuilder<String>(
  //     future: showFirst(),
  //     builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
  //       if (snapshot.connectionState == ConnectionState.done &&
  //           null != snapshot.data) {
  //         //  tmpFile = snapshot.data;
  //         //base64Image = base64Encode(snapshot.data.readAsBytesSync());
  //         return Flexible(
  //           child: Image.network(
  //             snapshot.data,
  //           ),
  //         );
  //       } else if (null != snapshot.error) {
  //         return const Text(
  //           'Error Picking Image',
  //           textAlign: TextAlign.center,
  //         );
  //       } else {
  //         return const Text(
  //           'No Image Selected',
  //           textAlign: TextAlign.center,
  //         );
  //       }
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryBackgroundColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.2 - 27,
              width: MediaQuery.of(context).size.width,
              child: SafeArea(
                child: Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: Text("Captura de Imágenes",
                          style: Theme.of(context).textTheme.headline5.copyWith(
                              fontWeight: FontWeight.bold,
                              color: kPrimaryTextColor,
                              fontSize: 35)),
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                gradient: kPrimaryGradientColor,
                // borderRadius: BorderRadius.only(
                //   bottomLeft: Radius.circular(36),
                //   bottomRight: Radius.circular(36),
                // ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Column(
                  children: [
                    FlatButton(
                      padding: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.white,
                      textColor: kSecondaryColor,
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
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: SingleChildScrollView(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width,
                          child: Flexible(
                              child: actual_url != null
                                  ? InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ZoomImage()));
                                      },
                                      child: Image.network(actual_url.image),
                                    )
                                  : Center(
                                      child: Text(
                                        'Sube una imagen desde tu galería o toma una foto.',
                                        style: TextStyle(
                                            color: kPrimaryTextColor,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                        ),
                      ),
                    ),

                    // Text(enhancements_images.id.toString()),
                    // Text(enhancements_images.name),
                    // Text("Correcion_gamma"),
                    // Image.network(
                    //   enhancements_images.enhancements[0].image,
                    // ),
                    // Text("Correcion_gamma"),
                    // Image.network(
                    //   enhancements_images.enhancements[1].image,
                    // ),
                    // Text("Correcion_gamma"),
                    // Image.network(
                    //   enhancements_images.enhancements[2].image,
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryBackgroundColor,
        child: Icon(
          Icons.camera,
          size: 50.0,
          color: Colors.white,
        ),
        onPressed: () {
          _getImageCamera();
        },
      ),
    );
  }
}
