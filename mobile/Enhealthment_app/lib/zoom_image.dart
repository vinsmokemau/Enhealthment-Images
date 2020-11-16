import 'package:flutter/material.dart';
import 'package:Enhealthment_app/body.dart';
import 'package:photo_view/photo_view.dart';
import 'package:Enhealthment_app/constants.dart';
import 'package:Enhealthment_app/menu.dart';

class ZoomImage extends StatefulWidget {
  @override
  _ZoomImageState createState() => _ZoomImageState();
}

class _ZoomImageState extends State<ZoomImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(
            Icons.arrow_back_ios,
            color: kPrimaryTextColor,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Menu()));
          },
        ),
        centerTitle: true,
        title: Text(
          'Imagen ingresada',
          style: TextStyle(color: kPrimaryTextColor),
        ),
        backgroundColor: Color(0xffbdfbfc),
        actions: [],
      ),
      body: PhotoView(
        imageProvider: NetworkImage(
          actual_url.image,
        ),
        minScale: PhotoViewComputedScale.contained,
        maxScale: PhotoViewComputedScale.covered * 2,
        enableRotation: false,
        backgroundDecoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            gradient: kPrimaryGradientColor),
      ),
      // Container(
      //   height: MediaQuery.of(context).size.height,
      //   width: MediaQuery.of(context).size.width,
      //   decoration: BoxDecoration(color: Colors.white),
      //   child: Image.network(actual_url.image),
      // ),
    );
  }
}
