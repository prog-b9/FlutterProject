import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app1/authentcation/Login.dart';
import 'package:flutter_app1/myData.dart';
import 'package:flutter_app1/pages/homePage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Splash extends StatefulWidget {
  @override
  _Splash createState() => _Splash();
}

class _Splash extends State<Splash> {
  Future getData() async {
    var url = Uri.http(ipconfig, 'getdata.php', {'q': '{http}'});
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var red = json.decode(response.body);
      setState(() {
        if (whatDoseLoginGoogleOrPhp == 0) {
          for (var i = 0; i < red.length; i++) {
            if (storage == red[i]["username"]) {
              idAuth = int.parse(red[i]["id"]) - 1;
              storage = red[idAuth]["username"].toString();
              email = red[idAuth]["email"].toString();
              pass = red[idAuth]["password"].toString();
              // for Page Edit
              controllerUsernameedit.text = storage;
              controllerPasswordedit.text = pass;
              controllerEmailedit.text = email;

              // usernameGoogleOrPhp = storage;
              // emailGoogleOrPhp = email;
              // passGoogleOrPhp = pass;
              // storage = username;

              print("home pahe : 0");
            }
          }
        }
      });
    }
  }

  Future GetDataUnversity() async {
    var response = await http.get(Uri.parse(api));
    var responseBody = await jsonDecode(response.body);

    if (response.statusCode == 200) {
      setState(() {
        data = responseBody;
      });
    }
  }

  //THIS IS SPLASH SCREEN
  @override
  void initState() {
    super.initState();
    GetDataUnversity();
    getData();

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
