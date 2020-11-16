import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:Enhealthment_app/constants.dart';

import 'package:Enhealthment_app/menu.dart';

class MauProfile extends StatefulWidget {
  @override
  _MauProfileState createState() => _MauProfileState();
}

class _MauProfileState extends State<MauProfile> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  TextEditingController nameInputController;
  TextEditingController emailInputController;
  TextEditingController messageInputController;

  Email email;

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Ingresa tu email correctamente';
    } else {
      return null;
    }
  }

  _launchFbURL() async {
    const url = 'https://www.facebook.com/mauricio.munguiagallegos';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchTwitterURL() async {
    const url = 'https://twitter.com/vinsmokemau/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchGithubURL() async {
    const url = 'https://github.com/vinsmokemau/';
    if (await canLaunch(url)) {
      await launch(url,
          forceWebView: true, enableJavaScript: true, enableDomStorage: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchInstaURL() async {
    const url = 'https://www.instagram.com/vinsmokemau/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameInputController = TextEditingController();
    emailInputController = TextEditingController();
    messageInputController = TextEditingController();
  }

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
            back = true;
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Menu()));
          },
        ),
        centerTitle: true,
        title: Text(
          'Datos de Contacto',
          style: TextStyle(color: kPrimaryTextColor),
        ),
        backgroundColor: Color(0xffbdfbfc),
        actions: [],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(gradient: kPrimaryGradientColor),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30.0),
              Padding(
                padding: EdgeInsets.all(18.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.33,
                  height: MediaQuery.of(context).size.width * 0.33,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                            MediaQuery.of(context).size.width * 0.33 / 2),
                      ),
                      image: DecorationImage(
                          image: AssetImage("assets/images/mau.png"),
                          fit: BoxFit.cover)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0),
                child: Text(
                  'Vinsmoke Mau',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _launchFbURL();
                      },
                      child: SvgPicture.asset(
                        'assets/icons/facebook.svg',
                        width: 30.0,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _launchTwitterURL();
                      },
                      child: SvgPicture.asset(
                        'assets/icons/twitter.svg',
                        width: 30.0,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _launchInstaURL();
                      },
                      child: SvgPicture.asset(
                        'assets/icons/instagram.svg',
                        width: 30.0,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _launchGithubURL();
                      },
                      child: SvgPicture.asset(
                        'assets/icons/github.svg',
                        width: 30.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 18.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
                child: Text(
                  'Contactar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Form(
                  key: _registerFormKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: TextFormField(
                          cursorColor: kSecondaryColor,
                          decoration: InputDecoration(
                            // icon: Icon(Icons.people),
                            labelText: 'Nombre',
                            hintText: "Ingresa tu nombre",
                            fillColor: Colors.white,
                            focusColor: Colors.green,

                            hoverColor: kSecondaryColor,
                          ),
                          controller: nameInputController,
                          validator: (value) {
                            if (value.length < 3) {
                              return "Ingresa tu nombre";
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: TextFormField(
                          cursorColor: kSecondaryColor,
                          decoration: InputDecoration(
                            // icon: Icon(Icons.email),
                            labelText: 'Correo electrónico',
                            hintText: "Ingresa tu correo electrónico",

                            fillColor: Colors.white,
                            focusColor: Colors.green,
                            hoverColor: Colors.blue,
                          ),
                          controller: emailInputController,
                          keyboardType: TextInputType.emailAddress,
                          validator: emailValidator,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: TextFormField(
                          cursorColor: kSecondaryColor,
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          decoration: InputDecoration(
                            // icon: Icon(Icons.people),
                            labelText: 'Mensaje',
                            hintText: "Ingresa tu mensaje",

                            fillColor: Colors.white,
                            focusColor: Colors.green,
                            hoverColor: Colors.blue,
                          ),
                          controller: messageInputController,
                          validator: (value) {
                            if (value.length < 3) {
                              return "Ingresa el mensaje";
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 18.0,
                        ),
                        child: MaterialButton(
                          onPressed: () async {
                            if (_registerFormKey.currentState.validate()) {
                              email = Email(
                                body: messageInputController.text.toString(),
                                subject: nameInputController.text.toString(),
                                recipients: ['maumg1196@gmail.com'],
                                cc: [emailInputController.text.toString()],
                                isHTML: false,
                              );
                              await FlutterEmailSender.send(email);
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 52.0, vertical: 12.0),
                            child: Text('Enviar',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                )),
                          ),
                          color: kSecondaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
