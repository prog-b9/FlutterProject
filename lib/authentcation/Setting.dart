import 'package:flutter/material.dart';
import 'package:flutter_app1/authentcation/Edit.dart';
import 'package:flutter_app1/custom/customSwitchesSettings.dart';
import 'package:flutter_app1/myData.dart';
import 'package:flutter_app1/authentcation/Login.dart';
import 'package:flutter_app1/pages/homePage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../custom/customBack.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Setting extends StatefulWidget {
  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  List isSwiched = [
    {
      "isSwichedBool": false,
      "isSwichedImg": "images/logo dark mode.png",
      "isSwichedTitle": "الوضع",
    },
    {
      "isSwichedBool": false,
      "isSwichedImg": "images/logo notification.png",
      "isSwichedTitle": "الاشعارات",
    },
  ];

  Future emailCurrent() async {
    email == controllerEmailedit.text;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      emailCurrent();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBack(onPress: () {
          setState(() {
            Pop(context);
          });
        }),
        centerTitle: true,
        title: const Text(
          "الإعدادات",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: fontGoogleCairo,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Color(darkBlueColor),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const SizedBox(
                  height: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(darkGreenColor)),
                  // padding: const EdgeInsets.all(10),
                  height: 170,
                  // width: 300,
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (whatDoseLoginGoogleOrPhp == 0 ||
                                  whatDoseLoginGoogleOrPhp == null)
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ClipRRect(
                                    child: Image.asset(
                                      "images/logo profile2.png",
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              else if (whatDoseLoginGoogleOrPhp == 1)
                                if (avatarGoogle == null)
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: ClipRRect(
                                      child: Image.asset(
                                        "images/logo profile2.png",
                                        width: 70,
                                        height: 70,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                else
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.network(
                                        avatarGoogle,
                                        width: 70,
                                        height: 70,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                              Expanded(
                                child: Container(
                                  // margin: const EdgeInsets.only(right: 50),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      if (whatDoseLoginGoogleOrPhp == 0 ||
                                          whatDoseLoginGoogleOrPhp == null)
                                        Text(
                                          storage ?? "Username Here",
                                          style: const TextStyle(
                                            fontFamily: fontGoogleCairo,
                                            fontSize: 25,
                                            // overflow: TextOverflow.ellipsis,
                                            color: Colors.white,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          // softWrap: true,
                                          // softWrap: true,

                                          textAlign: TextAlign.start,
                                        )
                                      else if (whatDoseLoginGoogleOrPhp == 1)
                                        Text(
                                          usernameGoogle ?? "Username Here",
                                          style: const TextStyle(
                                            fontFamily: fontGoogleCairo,
                                            fontSize: 25,
                                            // overflow: TextOverflow.ellipsis,
                                            color: Colors.white,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          // softWrap: true,
                                          // softWrap: true,

                                          textAlign: TextAlign.start,
                                        ),
                                      if (whatDoseLoginGoogleOrPhp == 0 ||
                                          whatDoseLoginGoogleOrPhp == null)
                                        Text(
                                          email ?? "Email Here",
                                          style: const TextStyle(
                                              fontFamily: fontGoogleCairo,
                                              fontSize: 17,
                                              color: Colors.white),
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      else if (whatDoseLoginGoogleOrPhp == 1)
                                        Text(
                                          emailGoogle ?? "Email Here",
                                          style: const TextStyle(
                                              fontFamily: fontGoogleCairo,
                                              fontSize: 17,
                                              color: Colors.white),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      if (whatDoseLoginGoogleOrPhp == 0)
                        Positioned(
                          bottom: 0,
                          right: 5,
                          child: IconButton(
                            onPressed: () {
                              if (storage == null) {
                                Fluttertoast.showToast(
                                  backgroundColor: Colors.white,
                                  textColor: Color(blackColor),
                                  msg: "سجل دخول أولاً",
                                  toastLength: Toast.LENGTH_SHORT,
                                  fontSize: 17,
                                );
                              } else {
                                Push(context, Edit());
                              }
                            },
                            icon: Image.asset(
                              "images/logo edit.png",
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.all(20),
                  // height: 270,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(darkGreenColor),
                  ),
                  child: Column(
                    children: [
                      CustomSwitchesSettings(
                        titleSwitches: isSwiched[0]["isSwichedTitle"],
                        imgSwitches: isSwiched[0]["isSwichedImg"],
                        valueSwitches: isSwiched[0]["isSwichedBool"],
                        switches: (status) {
                          setState(() {
                            isSwiched[0]["isSwichedBool"] = status;

                            // print(isSwiched[0]["isSwichedBool"]);
                            // if (mode == true) {
                            //   // mode = isSwiched[0]["isSwichedBool"];
                            //   darkBlueColor = 0xff182e3c;
                            //   darkGreenColor = 0xff276367;
                            // } else {
                            //   darkBlueColor = 0xffffffff;
                            //   darkGreenColor = 0xff666666;
                            // mode = isSwiched[1]["isSwichedBool"];
                            // }
                          });
                        },
                      ),
                      CustomSwitchesSettings(
                        titleSwitches: isSwiched[1]["isSwichedTitle"],
                        imgSwitches: isSwiched[1]["isSwichedImg"],
                        valueSwitches: isSwiched[1]["isSwichedBool"],
                        switches: (status) {
                          setState(() {
                            isSwiched[1]["isSwichedBool"] = status;
                            print("Notification");
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(darkGreenColor),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(100, 99, 138, 127),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Color(darkGreenColor),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(50),
                                    ),
                                  ),
                                  builder: (context) => SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  Pop(context);
                                                },
                                                icon: const Icon(
                                                  Icons
                                                      .keyboard_arrow_up_rounded,
                                                  color: Colors.white,
                                                  size: 50,
                                                ),
                                              ),
                                              Container(),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 300,
                                          width: 400,
                                          child: Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: Text(
                                              WhoAreWe,
                                              style: const TextStyle(
                                                fontFamily: fontGoogleCairo,
                                                fontSize: 20,
                                                color: Colors.white,
                                              ),
                                              textAlign: TextAlign.right,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios_rounded,
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const Text(
                                  'من نحن ؟',
                                  style: TextStyle(
                                      fontFamily: fontGoogleCairo,
                                      fontSize: 17,
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const CircleAvatar(
                                  backgroundImage:
                                      AssetImage('images/logo help.png'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
