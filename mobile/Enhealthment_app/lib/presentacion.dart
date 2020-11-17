import 'package:flutter/material.dart';
import 'package:Enhealthment_app/constants.dart';
import 'package:Enhealthment_app/Antonio.dart';
import 'package:Enhealthment_app/Argeo.dart';
import 'package:Enhealthment_app/Mau.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class Presentacion extends StatefulWidget {
  @override
  _PresentacionState createState() => _PresentacionState();
}

class _PresentacionState extends State<Presentacion> {
  _launchImhealthment() async {
    const url = 'http://imhealthment.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
                    child: Text('Información',
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            fontWeight: FontWeight.bold,
                            color: kPrimaryTextColor,
                            fontSize:
                                MediaQuery.of(context).size.width * 0.08)),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                gradient: kPrimaryGradientColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36.0),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Proyecto 1: "Mejora de imágenes"',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              color: kSecondaryColor,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.07,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Se desarrolló un API que al guardar las imagenes en la base de datos genera las modificaciones de la imagen y las relaciona con la imagen original. La App Web y Móvil consumen la API para mostrar el contenido.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              color: kPrimaryTextColor,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Text(
                            'Desarrolladores: ',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                color: kSecondaryColor,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.07,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            dense: true,
                            leading: SizedBox(
                              height: MediaQuery.of(context).size.width * 0.12,
                              width: MediaQuery.of(context).size.width * 0.12,
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/toño.png'),
                              ),
                            ),
                            title: Text(
                              'Luis Antonio Domínguez González',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: kPrimaryTextColor,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.06,
                                  fontWeight: FontWeight.bold),
                            ),
                            onLongPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AntonioProfile()));
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            dense: true,
                            leading: SizedBox(
                              height: MediaQuery.of(context).size.width * 0.12,
                              width: MediaQuery.of(context).size.width * 0.12,
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/argeo.png'),
                              ),
                            ),
                            title: Text(
                              'Argeo Thelian Gutiérrez Villaseñor',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: kPrimaryTextColor,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.06,
                                  fontWeight: FontWeight.bold),
                            ),
                            onLongPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ArgeoProfile()));
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            dense: false,
                            leading: SizedBox(
                              height: MediaQuery.of(context).size.width * 0.12,
                              width: MediaQuery.of(context).size.width * 0.12,
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/mau.png'),
                              ),
                            ),
                            title: Text(
                              'Mauricio Munguia Gallegos',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: kPrimaryTextColor,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.06,
                                  fontWeight: FontWeight.bold),
                            ),
                            onLongPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MauProfile()));
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Text(
                            'Versión Web (Alpha)',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                color: kSecondaryColor,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.07,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            dense: true,
                            leading: SizedBox(
                              height: MediaQuery.of(context).size.width * 0.12,
                              width: MediaQuery.of(context).size.width * 0.12,
                              child: CircleAvatar(
                                backgroundColor: kPrimaryBackgroundColor,
                                backgroundImage:
                                    AssetImage('assets/icons/logofondo.png'),
                              ),
                            ),
                            title: Text(
                              'Imhealthment',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: kPrimaryTextColor,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.06,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'Mantener presionado para ir al sitio web.',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: kPrimaryTextColor,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.036,
                              ),
                            ),
                            onLongPress: () {
                              _launchImhealthment();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
