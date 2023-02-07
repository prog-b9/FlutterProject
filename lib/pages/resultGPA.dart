import 'package:flutter/material.dart';
import 'package:flutter_app1/myData.dart';
import 'package:flutter_app1/custom/customBack.dart';
import 'package:flutter_app1/custom/customTextBtnCard.dart';
import 'package:flutter_app1/pages/addMaterialTerm.dart';
import 'package:flutter_app1/pages/homePage.dart';
import 'dart:core';
import 'dart:math' as Math;

class ResultGPA extends StatefulWidget {
  const ResultGPA({super.key});

  @override
  State<ResultGPA> createState() => _ResultGPAState();
}

class _ResultGPAState extends State<ResultGPA> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changesGradeFromNumToChar();
  }

  @override
  Widget build(BuildContext context) {
    var resultGPACharHerePage;
    var resultGPATitleHerePage;
    if (whatChooseTermOrCumulative == objGPA.term) {
      resultGPA = resultGPAnum;
      resultGPACharHerePage = resultGPAchar;
      resultGPATitleHerePage = resultGPAtitle;
    } else if (whatChooseTermOrCumulative == objGPA.cumulative) {
      resultGPA = resultGPAnumCumulative;
      resultGPACharHerePage = resultGPAchar;
      resultGPATitleHerePage = resultGPAtitle;
    }
    return Scaffold(
      backgroundColor: Color(darkBlueColor),
      appBar: AppBar(
        leading: CustomBack(onPress: () {
          setState(() {
            changesGradeFromNumToChar();
            resultGPAnum = 0;
            resultGPAnumCumulative = 0;
            resultGPA = 0;
            resultGPAnumAndcountChooseListTimer = 0; // 52

            resultCountBeforeGradeAndCountBeforeTimer = 0; // 217.25

            resultGradeAndTimerForTermAndCumulative = 0; // 52 + 217.25 = 269.25

            resultTimerTermAndCumulative = 0; // 16 + 55 = 71

            countChooseList = 0;
            countChooseListTimer = 0;
            resultGPAchar = "";
            resultGPAtitle = "";

            chooseListOther.clear();
            Pop(context);
          });
        }),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          whatChooseTermOrCumulative,
          style: const TextStyle(
            fontFamily: fontGoogleCairo,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              resultGPA.toStringAsFixed(2),
              // resultGPA.toString().substring(0, 4),
              style: TextStyle(
                fontSize: 70,
                fontFamily: fontGoogleCairo,
                fontWeight: FontWeight.bold,
                color: Color(lightGreenColor),
              ),
            ),
            Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(lightGreenColor), width: 5),
                  borderRadius: BorderRadius.circular(150),
                ),
                child: Center(
                  child: Text(
                    resultGPACharHerePage.toString(),
                    style: TextStyle(
                      fontSize: 80,
                      fontFamily: fontGoogleCairo,
                      fontWeight: FontWeight.bold,
                      color: Color(lightGreenColor),
                    ),
                  ),
                )),
            Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(darkGreenColor),
              ),
              child: Center(
                child: Text(
                  resultGPATitleHerePage.toString(),
                  style: const TextStyle(
                    fontSize: 23,
                    fontFamily: fontGoogleCairo,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            // Container(
            //   alignment: Alignment.center,
            //   child: ElevatedButton(
            //     onPressed: () {
            //       setState(() {
            //         changesGradeFromNumToChar();
            //         resultGPAchar = "";
            //         resultGPAtitle = "";
            //         resultGPAnum = 0;
            //         resultGPAnumCumulative = 0;
            //         resultGPA = 0;
            //         resultGPAnumAndcountChooseListTimer = 0; // 52

            //         resultCountBeforeGradeAndCountBeforeTimer = 0; // 217.25

            //         resultGradeAndTimerForTermAndCumulative =
            //             0; // 52 + 217.25 = 269.25

            //         resultTimerTermAndCumulative = 0; // 16 + 55 = 71
            //         controllerCounterMaterialsBeforeGrade.text = "";
            //         controllerCounterMaterialsBeforeTimer.text = "";
            //         clears();

            //         Push(context, const Homepage());
            //       });
            //     },
            //     style: ElevatedButton.styleFrom(
            //       minimumSize: const Size(270, 0),
            //       elevation: 0,
            //       backgroundColor: Color(darkGreenColor),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //     ),
            //     child: const Text(
            //       "الصفحة الرئيسة",
            //       style: TextStyle(
            //         fontSize: 23,
            //         fontFamily: fontGoogleCairo,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
