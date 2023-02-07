import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app1/myData.dart';
import 'package:flutter_app1/pages/homePage.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:math';

import '../custom/customBack.dart';

class ResultQuestion extends StatefulWidget {
  const ResultQuestion({super.key});

  @override
  State<ResultQuestion> createState() => _ResultQuestionState();
}

class _ResultQuestionState extends State<ResultQuestion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          "نتائج الاختبار",
          style: TextStyle(fontFamily: fontGoogleCairo, fontSize: 30),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(darkBlueColor),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(darkGreenColor),
              ),
              height: 230,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomResultQuestion(
                      majorName: "مسار العلمي",
                      percent:
                          "${resultQuestionPercenterScience.toStringAsFixed(1)}%",
                      percentFormTen: resultQuestionScience,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: CustomResultQuestion(
                        majorName: "مسار الصحي",
                        percent:
                            "${resultQuestionPercenterHelthy.toStringAsFixed(1)}%",
                        percentFormTen: resultQuestionHelthy,
                      ),
                    ),
                    CustomResultQuestion(
                      majorName: "مسار الإنساني",
                      percent:
                          "${resultQuestionPercenterRelation.toStringAsFixed(1)}%",
                      percentFormTen: resultQuestionRelation,
                    ),
                  ],
                ),
              ),
            ),
            CustomBtn(
              title: "الصفحة الرئيسة",
              onPress: () {
                setState(() {
                  Push(context, const Homepage());
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

// This is Custom For Result Question

class CustomResultQuestion extends StatelessWidget {
  CustomResultQuestion({
    Key? key,
    required this.majorName,
    required this.percent,
    required this.percentFormTen,
  }) : super(key: key);

  var majorName;
  var percent;
  var percentFormTen;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularPercentIndicator(
          radius: 50,
          lineWidth: 10,
          percent: percentFormTen,
          animation: true,
          animationDuration: 1000,
          progressColor: Color(lightGreenColor),
          backgroundColor: Color.fromARGB(100, 99, 138, 127),
          circularStrokeCap: CircularStrokeCap.round,
          center: Text(
            percent,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontFamily: fontGoogleCairo,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          majorName,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: fontGoogleCairo,
          ),
        ),
      ],
    );
  }
}
