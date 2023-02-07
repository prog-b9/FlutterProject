import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app1/authentcation/Login.dart';
import 'package:flutter_app1/myData.dart';
import 'package:flutter_app1/pages/homePage.dart';

class Splash extends StatefulWidget {
  @override
  _Splash createState() => _Splash();
}

class _Splash extends State<Splash> {
  //Colour Themes
  var lightGreenColor = 0xff48D8A4;
  var darkGreenColor = 0xff276367;
  var darkBlueColor = 0xff182e3c;
  var bgGreenColor = 0xffDFCDCD;
  var whiteWithLightBlueColor = 0xffCDF3FF;
  //THIS IS SPLASH SCREEN
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (storage != null || usernameGoogle != null) {
        Push(context, const Homepage());
      } else {
        Push(context, Login());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(darkBlueColor),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(),
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: const Image(
                    image: AssetImage("images/Logo Design important.png"),
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "سُلَّم",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                    fontFamily: 'ElMessiri',
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const Text(
              "v1النسخة الاولى",
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
