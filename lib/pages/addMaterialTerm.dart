import 'package:flutter/material.dart';
import 'package:flutter_app1/myData.dart';
import 'package:flutter_app1/custom/customBack.dart';
import 'package:flutter_app1/pages/resultGPA.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddMaterialTerm extends StatefulWidget {
  const AddMaterialTerm({super.key});

  @override
  State<AddMaterialTerm> createState() => _AddMaterialTermState();
}

class _AddMaterialTermState extends State<AddMaterialTerm> {
  void _modalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Color(darkGreenColor),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      builder: (context) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: SizedBox(
            height: 600,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(),
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
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    child: SingleChildScrollView(
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 70,
                          mainAxisSpacing: 40,
                        ),
                        itemCount: gradesList.length,
                        itemBuilder: (context, index) {
                          return TextButton(
                            onPressed: () {
                              setState(
                                () {
                                  chooseList.removeAt(ww);
                                  chooseList.insert(ww, gradesList[index]);
                                  Pop(context);
                                },
                              );
                            },
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromARGB(100, 99, 138, 127),
                              ),
                              child: Center(
                                child: Text(
                                  gradesList[index],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _modalBottomSheetTimer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Color(darkGreenColor),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      builder: (context) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: SizedBox(
            height: 600,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(),
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
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    child: SingleChildScrollView(
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 70,
                          mainAxisSpacing: 40,
                        ),
                        itemCount: TimerList.length,
                        itemBuilder: (context, index) {
                          return TextButton(
                            onPressed: () {
                              setState(() {
                                chooseListTimer.removeAt(ww);
                                chooseListTimer.insert(ww, TimerList[index]);

                                Pop(context);
                              });
                            },
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromARGB(100, 99, 138, 127),
                              ),
                              child: Center(
                                child: Text(
                                  TimerList[index].toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBack(
          onPress: () {
            // clears();
            resultGPAnum = 0;
            resultGPAnumCumulative = 0;
            resultGPAchar = "";
            resultGPAtitle = "";

            Pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          whatChooseTermOrCumulative,
          style: const TextStyle(fontFamily: fontGoogleCairo, fontSize: 30),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(darkBlueColor),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          // margin: const EdgeInsets.only(bottom: 20),
          child: ListView.builder(
            itemCount: countMaterialList.length,
            // itemCount: ListMaterialFromZeroToEnd.length,
            itemBuilder: (context, i) {
              return Dismissible(
                // what do you wnat delete? any value ?
                key: ValueKey(countMaterialList[i]),
                // key: ValueKey(ListMaterialFromZeroToEnd[i]),
                // delete from drag right
                direction: DismissDirection.endToStart,
                background: Container(
                  alignment: Alignment.centerRight,
                  // color: Colors.amber,
                  child: Container(
                    width: 70,
                    height: 80,
                    alignment: Alignment.center,
                    // padding: const EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                // Container(
                //   height: 110,
                //   padding: const EdgeInsets.all(24),
                //   margin: const EdgeInsets.symmetric(vertical: 10),
                //   alignment: Alignment.centerRight,
                //   // margin: const EdgeInsets.symmetric(horizontal: 20),
                //   decoration: BoxDecoration(
                //     color: Colors.redAccent,
                //     borderRadius: BorderRadius.circular(25),
                //   ),
                //   child: const Icon(
                //     Icons.delete,
                //     size: 40,
                //     color: Colors.white,
                //   ),
                // ),

                onDismissed: (direction) {
                  setState(
                    () {
                      // ListMaterialFromZeroToEnd.removeAt(i);
                      countMaterialList.removeAt(i);
                      countMaterial--;
                      chooseList.removeAt(i);
                      chooseListTimer.removeAt(i);
                      checkGrade.removeAt(i);
                      checkTimer.removeAt(i);
                      // chooseGrade.add(choose);
                      // on delete the box counter ok one , two
                      // counterOfCustomContainerGrade--;
                    },
                  );
                },
                child: Container(
                  height: 120,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    // borderRadius: const BorderRadius.only(
                    //   topRight: Radius.circular(0),
                    //   bottomRight: Radius.circular(0),
                    //   topLeft: Radius.circular(25),
                    //   bottomLeft: Radius.circular(25),
                    // ),
                    borderRadius: BorderRadius.circular(20),
                    color: Color(darkGreenColor),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text(
                              "المعدل",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: fontGoogleCairo,
                              ),
                            ),
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 190, 190, 190),
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: Colors.transparent,
                                  width: 4,
                                ),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  _modalBottomSheet(context);
                                  ww = i;
                                  print(ww);
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (chooseList.isNotEmpty)
                                      for (int j = 0;
                                          j < chooseList.length;
                                          j++)
                                        if (i == j)
                                          DefaultTextStyle(
                                            style: TextStyle(
                                              color: Color(blackColor),
                                              fontSize: 20,
                                            ),
                                            child: Column(
                                              children: [
                                                if (chooseList[j].toString() ==
                                                    "")
                                                  Text(
                                                    "A+",
                                                    style: TextStyle(
                                                      color: Color(blackColor)
                                                          .withOpacity(0.5),
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  )
                                                else
                                                  Text(
                                                    chooseList[j].toString(),
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                              ],
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text(
                              "عددالساعات",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: fontGoogleCairo,
                              ),
                            ),
                            Container(
                              width: 60,
                              height: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 190, 190, 190),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  _modalBottomSheetTimer(context);
                                  ww = i;
                                  print(ww);
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (chooseListTimer.isNotEmpty)
                                      for (int j = 0;
                                          j < chooseListTimer.length;
                                          j++)
                                        if (i == j)
                                          DefaultTextStyle(
                                            style: TextStyle(
                                              color: Color(blackColor),
                                              fontSize: 20,
                                            ),
                                            child: Column(
                                              children: [
                                                if (chooseListTimer[j]
                                                        .toString() ==
                                                    "")
                                                  Text(
                                                    "3",
                                                    style: TextStyle(
                                                      color: Color(blackColor)
                                                          .withOpacity(0.5),
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  )
                                                else
                                                  Text(
                                                    chooseListTimer[j]
                                                        .toString(),
                                                    style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80,
          color: Color(darkBlueColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomBtn(
                  title: "أحسب المعدل",
                  onPress: () {
                    // Start

                    for (var i = 0; i < countMaterialList.length; i++) {
                      if (chooseList[i] != "") {
                        checkGrade[i] = true;
                      }
                      if (chooseListTimer[i] != "") {
                        checkTimer[i] = true;
                      }
                    }

                    if (countMaterialList.isEmpty) {
                      toastMsg("أدخل موادك");
                    } else {
                      if (checkGrade.contains(false) ||
                          checkTimer.contains(false)) {
                        null;

                        toastMsg("أدخل الساعة او رمز المعدل");
                      } else if (checkGrade.contains(true) &&
                          checkTimer.contains(true)) {
                        for (var i = 0; i < chooseList.length; i++) {
                          switch (chooseList[i]) {
                            case "A+":
                              chooseList[i] = 5;
                              break;
                            case "A":
                              chooseList[i] = 4.75;
                              break;
                            case "B+":
                              chooseList[i] = 4.5;
                              break;
                            case "B":
                              chooseList[i] = 4;
                              break;
                            case "C+":
                              chooseList[i] = 3.5;
                              break;
                            case "C":
                              chooseList[i] = 3;
                              break;
                            case "D+":
                              chooseList[i] = 2.5;
                              break;
                            case "D":
                              chooseList[i] = 2;
                              break;
                            case "F":
                              chooseList[i] = 1;
                              break;
                            default:
                          }
                        }

                        for (var i = 0; i < countMaterialList.length; i++) {
                          var s = chooseList[i] * chooseListTimer[i];
                          chooseListOther.add(s);
                          // resultGPAnum = chooseList[i] * chooseListTimer[i];
                        }
                        for (var i = 0; i < chooseListTimer.length; i++) {
                          countChooseListTimer.toString();
                          countChooseListTimer += chooseListTimer[i];
                        }
                        for (var i = 0; i < chooseListOther.length; i++) {
                          countChooseList += chooseListOther[i];
                        }

                        resultGPAnum = countChooseList / countChooseListTimer;

                        if (resultGPAnum <= 5.0 && resultGPAnum >= 4.75) {
                          resultGPAchar = "A+";
                          resultGPAtitle = "ممتاز مرتفع";
                        } else if (resultGPAnum < 4.75 &&
                            resultGPAnum >= 4.50) {
                          resultGPAchar = "A";
                          resultGPAtitle = "ممتاز";
                        } else if (resultGPAnum < 4.5 && resultGPAnum >= 4.0) {
                          resultGPAchar = "B+";
                          resultGPAtitle = "جيد جداً مرتفع";
                        } else if (resultGPAnum < 4.0 && resultGPAnum >= 3.5) {
                          resultGPAchar = "B";
                          resultGPAtitle = "جيد جداً";
                        } else if (resultGPAnum < 3.5 && resultGPAnum >= 3.0) {
                          resultGPAchar = "C+";
                          resultGPAtitle = "جيد مرتفع";
                        } else if (resultGPAnum < 3.0 && resultGPAnum >= 2.5) {
                          resultGPAchar = "C";
                          resultGPAtitle = "جيد";
                        } else if (resultGPAnum < 2.5 && resultGPAnum >= 2.0) {
                          resultGPAchar = "D+";
                          resultGPAtitle = "مقبول مرتفع";
                        } else if (resultGPAnum < 2.0 && resultGPAnum >= 1.5) {
                          resultGPAchar = "D";
                          resultGPAtitle = "مقبول";
                        } else if (resultGPAnum < 1.5 && resultGPAnum >= 1.0) {
                          resultGPAchar = "F";
                          resultGPAtitle = "راسب";
                        }

                        Push(context, const ResultGPA());
                      }
                    }

                    // End
                  }),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    countMaterialList.add(countMaterial);
                    countMaterial++;

                    chooseList.add("");
                    chooseListTimer.add("");

                    // check
                    checkGrade.add(false);
                    checkTimer.add(false);
                  });
                },
                backgroundColor: Color(darkGreenColor),
                child: const Icon(
                  Icons.add,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
