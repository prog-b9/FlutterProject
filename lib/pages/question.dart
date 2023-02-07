import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app1/myData.dart';
import 'package:flutter_app1/custom/customBack.dart';
import 'package:flutter_app1/pages/resultQuestion.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Question extends StatefulWidget {
  const Question({super.key});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    questionList.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBack(onPress: () {
          Pop(context);
        }),
        title: const Text(
          "اختبار تحديد المسار",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontFamily: fontGoogleCairo,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Color(darkBlueColor),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LinearPercentIndicator(
                    lineHeight: 10,
                    backgroundColor: const Color.fromARGB(100, 99, 138, 127),
                    progressColor: Color(lightGreenColor),
                    percent: counterQuestionListPercent / questionList.length,
                    barRadius: const Radius.circular(25),
                    animation: true,
                    animationDuration: 500,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "${counterQuestionList + 1}",
                        style: TextStyle(
                          color: Color(lightGreenColor),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "/",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${questionList.length}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                // color: Colors.red,
                margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Container(
                      width: 500,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(darkGreenColor),
                      ),
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        "${questionList[counterQuestionList]["question"]} ؟",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: fontGoogleCairo,
                          fontSize: 19,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    for (int i = 0; i < answers.length; i++)
                      Container(
                        width: 500,
                        height: 60,
                        margin: EdgeInsets.only(bottom: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (counterQuestionList < questionList.length) {
                                // 1...28 <  29
                                //////////result Helthy/////////////////
                                myChooseAnswer = answers[i];

                                if (questionList[counterQuestionList]["id"] ==
                                    0) {
                                  chooseAndSelecetedAnswers();

                                  ListResultQuestionHelthy.add(
                                      selecetedAnswers);

                                  // counterResultQuestionHelthy +=
                                  //     selecetedAnswers;

                                  // if (counterResultQuestionHelthy >= 0) {
                                  //   counterResultQuestionHelthy +=
                                  //       selecetedAnswers;
                                  // } else if (counterResultQuestionHelthy <= 0) {
                                  //   counterResultQuestionHelthy = 0;
                                  // }

                                  //////////result Science/////////////////
                                } else if (questionList[counterQuestionList]
                                        ["id"] ==
                                    1) {
                                  chooseAndSelecetedAnswers();
                                  ListResultQuestionScience.add(
                                      selecetedAnswers);
                                  // counterResultQuestionScience +=
                                  //     selecetedAnswers;

                                  // if (counterResultQuestionScience >= 0) {
                                  //   counterResultQuestionScience +=
                                  //       selecetedAnswers;
                                  // } else if (counterResultQuestionScience <=
                                  //     0) {
                                  //   counterResultQuestionScience = 0;
                                  // }
                                }
                                //////////result Relation/////////////////

                                else if (questionList[counterQuestionList]
                                        ["id"] ==
                                    2) {
                                  chooseAndSelecetedAnswers();
                                  ListResultQuestionRelation.add(
                                      selecetedAnswers);

                                  // counterResultQuestionRelation +=
                                  //     selecetedAnswers;

                                  // if (counterResultQuestionRelation >= 0) {
                                  //   counterResultQuestionRelation +=
                                  //       selecetedAnswers;
                                  // } else if (counterResultQuestionRelation <=
                                  //     0) {
                                  //   counterResultQuestionRelation = 0;
                                  // }
                                }

                                counterQuestionList++;
                                counterQuestionListPercent =
                                    counterQuestionList;

                                //this condidion go to page resultQuestion
                                if (counterQuestionList ==
                                    questionList.length) {
                                  // way counterQuestionList-- becoase counterQuestionList == 30 and no index 30 in questionList 29 End;
                                  counterQuestionList--;

                                  for (var i = 0; i < 5; i++) {
                                    if (ListResultQuestionHelthy[i] > 0) {
                                      counterResultQuestionHelthy +=
                                          ListResultQuestionHelthy[i];
                                    }
                                    if (ListResultQuestionScience[i] > 0) {
                                      counterResultQuestionScience +=
                                          ListResultQuestionScience[i];
                                    }
                                    if (ListResultQuestionRelation[i] > 0) {
                                      counterResultQuestionRelation +=
                                          ListResultQuestionRelation[i];
                                    }
                                  }

                                  // this conidtion if countersResultQuestion less from 0 Exam : (-1,-2,-3,....)
                                  if (counterResultQuestionHelthy < 0) {
                                    counterResultQuestionHelthy = 0;
                                  }

                                  if (counterResultQuestionScience < 0) {
                                    counterResultQuestionScience = 0;
                                  }

                                  if (counterResultQuestionRelation < 0) {
                                    counterResultQuestionRelation = 0;
                                  }

                                  // result = 0.54 || 0.9
                                  resultQuestionHelthy =
                                      counterResultQuestionHelthy / 10;
                                  resultQuestionScience =
                                      counterResultQuestionScience / 10;
                                  resultQuestionRelation =
                                      counterResultQuestionRelation / 10;

                                  // result = 54% || 90%
                                  resultQuestionPercenterHelthy =
                                      resultQuestionHelthy * 100;
                                  resultQuestionPercenterScience =
                                      resultQuestionScience * 100;
                                  resultQuestionPercenterRelation =
                                      resultQuestionRelation * 100;

                                  // Timer(const Duration(seconds: 1), () {
                                  Push(context, const ResultQuestion());
                                  // });
                                }
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(270, 0),
                            backgroundColor: Color.fromARGB(195, 39, 99, 103),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                width: 5,
                                color: Color(darkGreenColor),
                              ),
                            ),
                          ),
                          child: Text(
                            answers[i],
                            style: TextStyle(
                              fontSize: 23,
                              fontFamily: fontGoogleCairo,
                            ),
                          ),
                        ),
                      ),
                  ],
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
