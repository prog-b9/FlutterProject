import 'package:flutter/material.dart';
import 'package:flutter_app1/myData.dart';
import 'package:flutter_app1/custom/customAllUnversity.dart';
import 'package:flutter_app1/custom/customBack.dart';
import 'package:flutter_app1/pages/allMajors.dart';
import 'package:flutter_app1/pages/homePage.dart';

class AllUnversity extends StatefulWidget {
  const AllUnversity({super.key});

  @override
  State<AllUnversity> createState() => _AllUnversityState();
}

class _AllUnversityState extends State<AllUnversity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(darkBlueColor),
      // backgroundColor: Color.fromARGB(255, 230, 255, 255),
  
      appBar: AppBar(
        leading: CustomBack(onPress: () {
          Push(context, const Homepage());
        }),
        title: const Text(
          "الجامعات",
          style: TextStyle(
            color: Colors.white,
            // color: Color(blackColor),
            fontSize: 30,
            fontFamily: fontGoogleCairo,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            for (int i = 0; i < data.length; i++)
              CustomAllUnversity(
                imgItem: data[i]["id"]["headerImg"],
                unversityNameItem: data[i]["id"]["unversityTitle"],
                onPress: () {
                  setState(() {
                    counterUnversity = i;
                    print(counterUnversity);
                    /////////////////
                    /////////////////
                    /////////////////
                    ///Start HighSchool
                    ///
                    // remove all result mozonah
                    resultMazonahRelation = 0;
                    resultMazonahScience = 0;
                    resultMazonahHelthy = 0;
                    // here start if - account result mozonah
                    if (resultMazonahHelthy == 0 &&
                        resultMazonahScience == 0 &&
                        resultMazonahRelation == 0) {
                      if (controllerHighSchool.text != "" &&
                          controllerCapacity.text != "" &&
                          controllerAttainment.text != "") {
                        for (var i = 0;
                            i < data[counterUnversity]["id"]["mazonah"].length;
                            i++) {
                          if (i == 0) {
                            resultHighSchoolRelation =
                                double.parse(controllerHighSchool.text) *
                                    data[counterUnversity]["id"]["mazonah"]
                                        ["relation"][0];
                            resultMazonahRelation += resultHighSchoolRelation;
                          } else if (i == 1) {
                            resultHighSchoolScience =
                                double.parse(controllerHighSchool.text) *
                                    data[counterUnversity]["id"]["mazonah"]
                                        ["science"][0];
                            resultMazonahScience += resultHighSchoolScience;
                          } else if (i == 2) {
                            resultHighSchoolHelthy =
                                double.parse(controllerHighSchool.text) *
                                    data[counterUnversity]["id"]["mazonah"]
                                        ["helthey"][0];
                            resultMazonahHelthy += resultHighSchoolHelthy;
                          }
                        }

                        ///End HighSchool

                        /////////////////
                        /////////////////
                        /////////////////
                        ///
                        // Start Capacity
                        ///

                        for (var i = 0;
                            i < data[counterUnversity]["id"]["mazonah"].length;
                            i++) {
                          if (i == 0) {
                            resultCapacityRelation =
                                double.parse(controllerCapacity.text) *
                                    data[counterUnversity]["id"]["mazonah"]
                                        ["relation"][1];
                            resultMazonahRelation += resultCapacityRelation;
                          } else if (i == 1) {
                            resultCapacityScience =
                                double.parse(controllerCapacity.text) *
                                    data[counterUnversity]["id"]["mazonah"]
                                        ["science"][1];
                            resultMazonahScience += resultCapacityScience;
                          } else if (i == 2) {
                            resultCapacityHelthy =
                                double.parse(controllerCapacity.text) *
                                    data[counterUnversity]["id"]["mazonah"]
                                        ["helthey"][1];
                            resultMazonahHelthy += resultCapacityHelthy;
                          }
                        }
                        // End Capacity

                        /////////////////
                        /////////////////
                        /////////////////

                        // Start Attianement

                        for (var i = 0;
                            i < data[counterUnversity]["id"]["mazonah"].length;
                            i++) {
                          if (i == 0) {
                            for (var i = 0;
                                i <
                                    data[counterUnversity]["id"]["mazonah"]
                                            ["relation"]
                                        .length;
                                i++) {
                              if (i == 2) {
                                resultAttainmentRelation =
                                    double.parse(controllerAttainment.text) *
                                        data[counterUnversity]["id"]["mazonah"]
                                            ["relation"][2];
                                resultMazonahRelation +=
                                    resultAttainmentRelation;
                              }
                            }
                          } else if (i == 1) {
                            for (var j = 0;
                                j <
                                    data[counterUnversity]["id"]["mazonah"]
                                            ["science"]
                                        .length;
                                j++) {
                              if (j == 2) {
                                resultAttainmentScience =
                                    double.parse(controllerAttainment.text) *
                                        data[counterUnversity]["id"]["mazonah"]
                                            ["science"][2];
                                resultMazonahScience += resultAttainmentScience;
                              }
                            }
                          } else if (i == 2) {
                            for (var j = 0;
                                j <
                                    data[counterUnversity]["id"]["mazonah"]
                                            ["helthey"]
                                        .length;
                                j++) {
                              if (j == 2) {
                                resultAttainmentHelthy =
                                    double.parse(controllerAttainment.text) *
                                        data[counterUnversity]["id"]["mazonah"]
                                            ["helthey"][2];
                                resultMazonahHelthy += resultAttainmentHelthy;
                              }
                            }
                          }
                        }
                        // End Attianement

                        // Start Step
                        for (var i = 0;
                            i < data[counterUnversity]["id"]["mazonah"].length;
                            i++) {
                          if (i == 0) {
                            for (var j = 0;
                                j <
                                    data[counterUnversity]["id"]["mazonah"]
                                            ["relation"]
                                        .length;
                                j++) {
                              if (j == 3) {
                                resultStepRelation =
                                    double.parse(controllerStep.text) *
                                        data[counterUnversity]["id"]["mazonah"]
                                            ["relation"][3];
                                resultMazonahRelation += resultStepRelation;
                              }
                            }
                          } else if (i == 1) {
                            for (var j = 0;
                                j <
                                    data[counterUnversity]["id"]["mazonah"]
                                            ["science"]
                                        .length;
                                j++) {
                              if (j == 3) {
                                resultStepScience =
                                    double.parse(controllerStep.text) *
                                        data[counterUnversity]["id"]["mazonah"]
                                            ["science"][3];
                                resultMazonahScience += resultStepScience;
                              }
                            }
                          } else if (i == 2) {
                            for (var j = 0;
                                j <
                                    data[counterUnversity]["id"]["mazonah"]
                                            ["helthey"]
                                        .length;
                                j++) {
                              if (j == 3) {
                                resultStepHelthy =
                                    double.parse(controllerStep.text) *
                                        data[counterUnversity]["id"]["mazonah"]
                                            ["helthey"][3];
                                resultMazonahHelthy += resultStepHelthy;
                              }
                            }
                          }
                        }
                        firstAccountMozonahOnOrOff = true;
                      }

                      // End Step

                    }

                    Push(context, AllMajors());
                  });
                },
              ),
          ],
        ),
      ),
    );
  }
}
