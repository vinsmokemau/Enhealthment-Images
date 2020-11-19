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
          'Imagen Ingresada',
          style: TextStyle(
              color: kPrimaryTextColor,
              fontSize: MediaQuery.of(context).size.width * 0.07),
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
    );
  }
}
