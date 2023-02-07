import 'package:flutter/material.dart';
import 'package:flutter_app1/authentcation/Login.dart';
import 'package:flutter_app1/authentcation/Mozonh.dart';
import 'package:flutter_app1/authentcation/Setting.dart';
import 'package:flutter_app1/custom/customAllUnversity.dart';
import 'package:flutter_app1/myData.dart';
import 'package:flutter_app1/pages/aboutAcceptanceRates.dart';
import 'package:flutter_app1/pages/allMajors.dart';
import 'package:flutter_app1/pages/allUnversity.dart';
import 'package:flutter_app1/pages/question.dart';
import 'package:flutter_app1/pages/sideBar.dart';
import 'package:flutter_app1/pages/switchGPA.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future readToken() async {
    // WidgetsFlutterBinding.ensureInitialized();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      whatDoseLoginGoogleOrPhp = prefs.getInt("storageId");
      if (whatDoseLoginGoogleOrPhp == 0) {
        storage = prefs.getString("storage");
      } else if (whatDoseLoginGoogleOrPhp == 1) {
        usernameGoogle = prefs.getString("storage");
      }
      print("storage : $storage");
      print("whatDoseLoginGoogleOrPhp : $whatDoseLoginGoogleOrPhp");
    });
  }

  // Future readTokenGoogle() async {
  //   // WidgetsFlutterBinding.ensureInitialized();
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     usernameGoogle = prefs.getString("storage");
  //     whatDoseLoginGoogleOrPhp = prefs.getInt("storageId");
  //     print("storage : $storage");
  //   });
  // }

  saveToken(String user, String email, String pass) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("storage", user);
    prefs.setString("storageEmail", email);
    prefs.setString("storagePass", pass);
    print(prefs.getString("storage"));
    print(prefs.getString("storageEmail"));
    print(prefs.getString("storagePass"));
  }

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
              controllerEmailedit.text = email;
              controllerPasswordedit.text = pass;

              // usernameGoogleOrPhp = storage;
              // emailGoogleOrPhp = email;
              // passGoogleOrPhp = pass;
              // storage = username;
              saveToken(storage, email, pass);
              funchideOrShowLogout();

              print("home pahe : 0");
            }
          }
        } else if (whatDoseLoginGoogleOrPhp == 1) {
          // usernameGoogleOrPhp = usernameGoogle;
          // emailGoogleOrPhp = emailGoogle;
          // avatarGoogleOrPhp = avatarGoogle;
          if (usernameGoogle != null) {
            saveToken(usernameGoogle, emailGoogle, avatarGoogle);
            funchideOrShowLogout();
          }
          print("home pahe : 1");
        }
        controllerUsernamelogin.text = "";
        controllerPasswordlogin.text = "";
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // if (whatDoseLoginGoogleOrPhp == 0) {
    readToken();
    // } else if (whatDoseLoginGoogleOrPhp == 1) {
    //   readTokenGoogle();
    // }
    getData();

    setState(() {});

    // if (mode == true) {
    //   print("darkMode");
    //   darkBlueColor = 0xff182e3c;
    // } else if (mode == false) {
    //   print("lightMode");
    //   darkBlueColor = 0xffffffff;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // clear arrow back from AppBar
        automaticallyImplyLeading: false,

        backgroundColor: Colors.transparent,
        elevation: 0,
        // automaticallyImplyLeading: false,
        actions: [
          Builder(builder: (context) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: Image.asset(
                  "images/logo menuBar.png",
                  color: Colors.white,
                  // color: Color(blackColor),
                ),
              ),
            );
          })
        ],
      ),
      endDrawer: const Drawer(child: SideBar()),
      backgroundColor: Color(darkBlueColor),
      // backgroundColor: Color.fromARGB(255, 230, 255, 255),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    // ignore: prefer_const_constructors
                    if (whatDoseLoginGoogleOrPhp == 0 ||
                        whatDoseLoginGoogleOrPhp == null)
                      Expanded(
                        child: Text(
                          storage == null ? "أهلاً بك" : storage + " أهلاً",
                          style: const TextStyle(
                            fontFamily: fontGoogleCairo,
                            fontSize: 34,
                            // color: Color(blackColor),
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.end,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    else if (whatDoseLoginGoogleOrPhp == 1)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              // ignore: prefer_if_null_operators
                              usernameGoogle == null
                                  ? "أهلاً بك"
                                  : usernameGoogle,
                              style: const TextStyle(
                                fontFamily: fontGoogleCairo,
                                fontSize: 34,
                                // color: Color(blackColor),
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.end,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (usernameGoogle != null)
                            const Text(
                              " أهلاً",
                              style: TextStyle(
                                fontFamily: fontGoogleCairo,
                                fontSize: 34,
                                // color: Color(blackColor),
                                color: Colors.white,
                              ),
                            ),
                        ],
                      ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  // width: 100,
                  height: 150,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: countContentGrid.length,
                    // scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            width: 70,
                            // height: 150,
                            margin: const EdgeInsets.only(right: 30, top: 15),
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(darkGreenColor),
                              // color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(1, 1),
                                  blurRadius: 0.5,
                                  spreadRadius: 1,
                                  color: Color(blackColor).withOpacity(0.1),
                                ),
                                BoxShadow(
                                  offset: Offset(-1, -1),
                                  blurRadius: 0.5,
                                  spreadRadius: 1,
                                  color: Color(blackColor).withOpacity(0.1),
                                ),
                              ],
                            ),
                            child: TextButton(
                              onPressed: () {
                                if (index == 0) {
                                  // counter++
                                  counterQuestionList = 0;
                                  // percent line page question
                                  counterQuestionListPercent = 0;

                                  // clear List [2,-1,0,-1,2]
                                  ListResultQuestionHelthy.clear();
                                  ListResultQuestionScience.clear();
                                  ListResultQuestionRelation.clear();

                                  // counter += 2 4 6 8 9 10 .....
                                  counterResultQuestionHelthy = 0;
                                  counterResultQuestionScience = 0;
                                  counterResultQuestionRelation = 0;
                                  // 45%
                                  resultQuestionPercenterScience = 0.0;
                                  resultQuestionPercenterHelthy = 0.0;
                                  resultQuestionPercenterRelation = 0.0;
                                  // 0.45
                                  resultQuestionScience = 0;
                                  resultQuestionHelthy = 0;
                                  resultQuestionRelation = 0;
                                }

                                // this is == myData
                                Push(context,
                                    countContentGrid[index]["onPress"]);
                              },
                              child: Container(
                                child: Image.asset(
                                  "${countContentGrid[index]["img"]}",
                                  color: Color(blackColor),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: 80,
                              margin: const EdgeInsets.only(right: 30),
                              child: Text(
                                "${countContentGrid[index]["title"]}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  // color: Color(blackColor),
                                  fontSize: 13,
                                  fontFamily: fontGoogleCairo,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Push(context, AllUnversity());
                      },
                      child: Image.asset(
                        "images/threePoint.png",
                        color: Colors.white,
                        // color: Color(blackColor),
                      ),
                    ),
                    const Text(
                      "الجامعات",
                      style: TextStyle(
                        fontFamily: fontGoogleCairo,
                        fontSize: 34,
                        color: Colors.white,
                        // color: Color(blackColor),
                      ),
                    ),
                  ],
                ),
                CustomAllUnversity(
                  imgItem: data[0]["id"]["headerImg"],
                  unversityNameItem: data[0]["id"]["unversityTitle"],
                  onPress: () {
                    counterUnversity = 0;
                    print(counterUnversity);
                    Push(context, AllMajors());
                  },
                ),
                CustomAllUnversity(
                  imgItem: data[1]["id"]["headerImg"],
                  unversityNameItem: data[1]["id"]["unversityTitle"],
                  onPress: () {
                    counterUnversity = 1;
                    print(counterUnversity);
                    Push(context, AllMajors());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
