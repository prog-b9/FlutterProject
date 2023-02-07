// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app1/authentcation/Edit.dart';
import 'package:flutter_app1/authentcation/Login.dart';
import 'package:flutter_app1/authentcation/Mozonh.dart';
import 'package:flutter_app1/authentcation/Register.dart';
import 'package:flutter_app1/authentcation/Setting.dart';
import 'package:flutter_app1/authentcation/Splash.dart';
import 'package:flutter_app1/custom/customAllMajors.dart';
import 'package:flutter_app1/myData.dart';
import 'package:flutter_app1/pages/aboutAcceptanceRates.dart';
import 'package:flutter_app1/pages/addMaterialCumulative.dart';
import 'package:flutter_app1/pages/addMaterialTerm.dart';
import 'package:flutter_app1/pages/allMajors.dart';
import 'package:flutter_app1/pages/allUnversity.dart';
import 'package:flutter_app1/custom/customBack.dart';
import 'package:flutter_app1/pages/homePage.dart';
import 'package:flutter_app1/pages/question.dart';
import 'package:flutter_app1/pages/resultGPA.dart';
import 'package:flutter_app1/pages/resultQuestion.dart';
import 'package:flutter_app1/pages/sideBar.dart';
import 'package:flutter_app1/pages/switchGPA.dart';
import 'package:flutter_app1/pages/test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  // ignore: prefer_const_constructors
  runApp(MaterialApp(
    home:
        const Directionality(textDirection: TextDirection.ltr, child: MyApp()),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future GetDataUnversity() async {
    var responseUrl = "https://api.jsonserve.com/kSNv9K";
    var response = await http.get(Uri.parse(responseUrl));
    var responseBody = await jsonDecode(response.body);

    if (response.statusCode == 200) {
      setState(() {
        data = responseBody;
      });
    }
  }

  Future readToken() async {
    // WidgetsFlutterBinding.ensureInitialized();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      whatDoseLoginGoogleOrPhp = prefs.getInt("storageId");
      if (whatDoseLoginGoogleOrPhp == 0) {
        storage = prefs.getString("storage");
        email = prefs.getString("storageEmail");
        pass = prefs.getString("storagePass");
      } else if (whatDoseLoginGoogleOrPhp == 1) {
        usernameGoogle = prefs.getString("storage");
        emailGoogle = prefs.getString("storageEmail");
        avatarGoogle = prefs.getString("storagePass");
      }
      // print("storage : $storage");
      // print("whatDoseLoginGoogleOrPhp : $whatDoseLoginGoogleOrPhp");
    });
  }

  // Future readToken() async {
  //   // WidgetsFlutterBinding.ensureInitialized();
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     storage = prefs.getString("storage");
  //     email = prefs.getString("storageEmail");
  //     pass = prefs.getString("storagePass");
  //     whatDoseLoginGoogleOrPhp = prefs.getInt("storageId");

  //     print("storage : $storage");
  //     print("email : $email");
  //     print("pass : $pass");
  //   });
  // }

  // Future readTokenGoogle() async {
  //   // WidgetsFlutterBinding.ensureInitialized();
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     usernameGoogle = prefs.getString("storage");
  //     emailGoogle = prefs.getString("storageEmail");
  //     avatarGoogle = prefs.getString("storagePass");
  //     whatDoseLoginGoogleOrPhp = prefs.getInt("storageId");

  //     print("main usernameGoogle : $usernameGoogle");
  //     print("main emailGoogle : $emailGoogle");
  //     print("main avatarGoogle : $avatarGoogle");
  //   });
  // }

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetDataUnversity();
    // if (whatDoseLoginGoogleOrPhp == 0) {
    readToken();
    // } else if (whatDoseLoginGoogleOrPhp == 1) {
    //   readTokenGoogle();
    // }
    getData();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Splash());
  }
}
