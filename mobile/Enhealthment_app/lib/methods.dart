import 'package:flutter/material.dart';
import 'package:Enhealthment_app/constants.dart';
import 'package:Enhealthment_app/body.dart';
import 'package:Enhealthment_app/zoom_methods.dart';

List<String> categories = [
  'Corrección Gamma',
  'Ecualización de Histograma',
  'Ecualización de Histograma Difuso',
  'Sharpening',
  // "Sharpening"
];
// By default our first item will be selected
int selectedIndex = 0;

class Methods extends StatefulWidget {
  @override
  _MethodsState createState() => _MethodsState();
}

class _MethodsState extends State<Methods> {
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
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Text("Métodos de mejora",
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            fontWeight: FontWeight.bold,
                            color: kPrimaryTextColor,
                            fontSize: MediaQuery.of(context).size.width * 0.1)),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                gradient: kPrimaryGradientColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(36.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.width * 0.07,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) => buildMethods(index),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: actual_url != null
                        ? InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ZoomMethod()));
                            },
                            child: Image.network(
                                actual_url.enhancements[selectedIndex].image))
                        : Center(
                            child: Text(
                              'Sube una imagen en la sección de Captura de Imágenes',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: kPrimaryTextColor,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.044,
                                  fontWeight: FontWeight.bold),
                            ),
                          )

                    //
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMethods(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index
                    ? kSecondaryColor
                    : kPrimaryTextColor,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0 / 4), //top padding 5
              height: MediaQuery.of(context).size.width * 0.005,
              width: MediaQuery.of(context).size.width * 0.1,
              color:
                  selectedIndex == index ? kSecondaryColor : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}

// class Categories extends StatefulWidget {
//   @override
//   _CategoriesState createState() => _CategoriesState();
// }

// class _CategoriesState extends State<Categories> {
//   // String dominos(){
//   //   setState(() {
//   //     pathImg =
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 20.0),
//       child: SizedBox(
//         height: 25,
//         child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: categories.length,
//           itemBuilder: (context, index) => buildCategory(index),
//         ),
//       ),
//     );
//   }

//   Widget buildCategory(int index) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedIndex = index;
//         });
//       },
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               categories[index],
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: selectedIndex == index
//                     ? kSecondaryColor
//                     : kPrimaryTextColor,
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: 20.0 / 4), //top padding 5
//               height: 2,
//               width: 30,
//               color:
//                   selectedIndex == index ? kSecondaryColor : Colors.transparent,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ImagesEnh extends StatefulWidget {
//   const ImagesEnh({
//     Key key,
//   }) : super(key: key);

//   @override
//   _ImagesEnhState createState() => _ImagesEnhState();
// }

// class _ImagesEnhState extends State<ImagesEnh> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     selectedIndex = selectedIndex;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             child: actual_url != null
//                 ? InkWell(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => ZoomMethod()));
//                     },
//                     child: Image.network(
//                         actual_url.enhancements[selectedIndex].image))
//                 : Center(
//                     child: Text(
//                       'Sube una imagen en la sección de Captura de Imágenes',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           color: kPrimaryTextColor,
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   )

//             //
//             ),
//       ),
//     );
//   }
// }
