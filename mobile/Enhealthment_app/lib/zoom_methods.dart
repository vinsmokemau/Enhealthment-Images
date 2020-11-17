import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:Enhealthment_app/body.dart';
import 'package:Enhealthment_app/constants.dart';
import 'package:Enhealthment_app/menu.dart';
import 'package:Enhealthment_app/methods.dart';

String titleAB;
void titleAppBar() {
  switch (selectedIndex) {
    case 0:
      titleAB = 'Corrección Gamma';
      break;
    case 1:
      titleAB = 'Ecualización de Histograma';
      break;
    case 2:
      titleAB = 'Ecualización de Histograma Difuso';
      break;
    case 3:
      titleAB = 'Sharpening';
      break;
  }
}

class ZoomMethod extends StatefulWidget {
  @override
  _ZoomMethodState createState() => _ZoomMethodState();
}

class _ZoomMethodState extends State<ZoomMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffbdfbfc),
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
          'Imagen Mejorada',
          style: TextStyle(color: kPrimaryTextColor),
        ),
        backgroundColor: Color(0xffbdfbfc),
        actions: [],
      ),
      body: PhotoView(
        imageProvider: NetworkImage(
          actual_url.enhancements[selectedIndex].image,
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
