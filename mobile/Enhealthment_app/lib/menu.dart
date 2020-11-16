import 'package:flutter/material.dart';
import 'package:Enhealthment_app/body.dart';
import 'package:Enhealthment_app/constants.dart';
import 'package:Enhealthment_app/methods.dart';
import 'package:Enhealthment_app/presentacion.dart';
import 'package:Enhealthment_app/Antonio.dart';
import 'package:Enhealthment_app/zoom_image.dart';

bool back = false;

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _pageController =
        back ? PageController(initialPage: 0) : PageController(initialPage: 1);
    back = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   title: Text('roh'),
        //   centerTitle: true,
        //   backgroundColor: pinkdemon,
        //   leading: IconButton(
        //     icon: Icon(Icons.beach_access),
        //     onPressed: () {},
        //   ),
        // ),
        body: Container(
          color: Colors.white,
          child: PageView(
            controller: _pageController,
            children: <Widget>[
              Presentacion(),
              Body(),
              Methods(),
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: pinkdemon,
        //   child: Icon(
        //     Icons.camera_alt,
        //     color: Colors.white,
        //     size: 38.0,
        //   ),
        //   onPressed: () {
        //     setState(() {
        //       _pageController.jumpToPage(1);
        //     });
        //   },
        // ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: kSecondaryColor,
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.person,
                  size: 24.0,
                ),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    _pageController.jumpToPage(0);
                  });
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.camera_alt,
                  size: 24.0,
                ),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    _pageController.jumpToPage(1);
                  });
                },
              ),
              IconButton(
                icon: Image.asset("assets/icons/camara_blanca.png"),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    _pageController.jumpToPage(2);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
