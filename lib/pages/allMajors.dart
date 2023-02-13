import 'package:flutter/material.dart';
import 'package:flutter_app1/authentcation/Mozonh.dart';
import 'package:flutter_app1/custom/customAllMajors.dart';
import 'package:flutter_app1/myData.dart';
import 'package:flutter_app1/custom/customBack.dart';
import 'dart:core';

import 'package:flutter_app1/pages/aboutAcceptanceRates.dart';

class AllMajors extends StatefulWidget {
  AllMajors({super.key});

  // var active;

  @override
  State<AllMajors> createState() => _AllMajorsState();
}

class _AllMajorsState extends State<AllMajors> {
  @override
  Widget build(BuildContext context) {
    List percent = [
      resultMazonahHelthy.toStringAsFixed(1),
      resultMazonahScience.toStringAsFixed(1),
      resultMazonahRelation.toStringAsFixed(1)
    ];
    return Scaffold(
      backgroundColor: Color(darkBlueColor),
      appBar: AppBar(
        leading: CustomBack(
          onPress: () {
            // resultMazonahRelation = 0;
            // resultMazonahScience = 0;
            // resultMazonahHelthy = 0;
            Pop(context);
          },
        ),
        title: const Text(
          "المسارات",
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontFamily: fontGoogleCairo,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          PopupMenuButton(
            elevation: 0,
            color: Color(darkGreenColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  // padding: EdgeInsets.symmetric(horizontal: 0),
                  value: 0,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Text(
                      "نبذة عن نسب القبول",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: fontGoogleCairo,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ];
            },
            onSelected: (value) {
              if (value == 0) {
                Push(context, const AboutRates());
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              width: 150,
              height: 180,
              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage(
                    data[counterUnversity]["id"]["headerImg"],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  // ElevatedButton(
                  //   onPressed: () {
                  //     setState(() {
                  //       Push(context, Mozonh());
                  //     });
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: Color(darkGreenColor),
                  //   ),
                  //   child: Row(
                  //     // ignore: prefer_const_literals_to_create_immutables
                  //     children: [
                  //       const Icon(Icons.calculate),
                  //       const SizedBox(
                  //         width: 10,
                  //       ),
                  //       const Text(
                  //         "احسبها",
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //           fontSize: 17,
                  //           fontFamily: fontGoogleCairo,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Container(),
                   Text(
                    firstAccountMozonahOnOrOff == true ? "موزونتك هي " : "أحسب موزونتك أول",
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: fontGoogleCairo,
                    ),
                  ),
                ],
              ),
            ),
            Card(
              color: Color.fromARGB(255, 114, 223, 250).withOpacity(0.2),
              margin: EdgeInsets.symmetric(horizontal: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (int i = 0; i < percent.length; i++)
                      Column(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            // ignore: prefer_const_constructors
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    data[i]["id"]["data"]["majorImg"][i]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "${percent[i]}%",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontFamily: fontGoogleCairo,
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: const Text(
                "أخر نسب قبول في التخصصات",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: fontGoogleCairo,
                ),
              ),
            ),
            //////////////////////////////////
            // content helthy major
            // content scinses major
            // content relation major
            //
            //
            // Start
            GetDataMajors(),
            // End
            //
            //
            //////////////////////////////////
            const SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    backgroundColor: Color(darkGreenColor),
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 400,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Pop(context);
                                      },
                                      icon: const Icon(
                                        Icons.keyboard_arrow_up_rounded,
                                        color: Colors.white,
                                        size: 50,
                                      ),
                                    ),
                                    Container(),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  data[counterUnversity]["id"]["about"],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: fontGoogleCairo,
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(270, 60),
                    backgroundColor: Color(darkGreenColor),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
                child: const Text(
                  "نبذة عن الجامعة",
                  style: TextStyle(
                    fontSize: 23,
                    fontFamily: fontGoogleCairo,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
