import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app1/myData.dart';
import 'package:flutter_app1/pages/addMaterialCumulative.dart';

class CustomBtnBeforeGeadeAndTimer extends StatefulWidget {
  const CustomBtnBeforeGeadeAndTimer({super.key});

  @override
  State<CustomBtnBeforeGeadeAndTimer> createState() =>
      _CustomBtnBeforeGeadeAndTimerState();
}

class _CustomBtnBeforeGeadeAndTimerState
    extends State<CustomBtnBeforeGeadeAndTimer> {
  void showModalHourseAndGPA(BuildContext context) {
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
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SizedBox(
            height: 400,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                Container(
                  // color: Colors.red,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(228, 43, 114, 119),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "المعدل السابق",
                            style: TextStyle(
                                fontFamily: fontGoogleCairo,
                                fontSize: 17,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 120,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 190, 190, 190),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              controller: controllerCounterMaterialsBeforeGrade,
                              onChanged: (value) {
                                setState(() {
                                  // List arr = [];
                                  // arr.add(value);
                                  // if (value[0] > 5) {
                                  //   print("input > 5");
                                  //   // print(arr[0]);
                                  // }

                                  // List cut = value.split("");
                                  // var maping = cut.map((e) => e);
                                  // var big = 5;
                                  // if (maping.first > big) {
                                  //   print("input > 5");
                                  // }

                                  // if (cut[0] > 5) {
                                  //   cut[0] = 5;
                                  //   print(cut);
                                  // }

                                  print(value);
                                });
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r"[0-9.]")),

                                // FilteringTextInputFormatter.digitsOnly
                              ],

                              style: TextStyle(
                                fontSize: 30,
                                // height: 1,
                                fontFamily: fontGoogleCairo,
                                fontWeight: FontWeight.bold,
                                color: Color(blackColor),
                              ),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              // textAlignVertical: TextAlignVertical.center,

                              decoration: InputDecoration(
                                filled: true,
                                hintText: "3.50",

                                // fillColor: Color(bgGreenColor).withOpacity(0.23),
                                fillColor: Colors.transparent,
                                // fillColor: const Color.fromARGB(255, 190, 190, 190),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 4,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),

                                hintStyle: TextStyle(
                                  color: Color(blackColor).withOpacity(0.5),
                                  fontSize: 30,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 4,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                      // color: Color(0xff222222),
                                      color: Colors.transparent),
                                ),
                                contentPadding: const EdgeInsets.all(0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "الساعات السابقة",
                            style: TextStyle(
                                fontFamily: fontGoogleCairo,
                                fontSize: 17,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 120,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 190, 190, 190),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              controller: controllerCounterMaterialsBeforeTimer,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r"[0-9]")),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              style: TextStyle(
                                fontSize: 30,
                                // height: 1,
                                fontFamily: fontGoogleCairo,
                                fontWeight: FontWeight.bold,
                                color: Color(blackColor),
                              ),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              // textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                filled: true,
                                hintText: "65",

                                // fillColor: Color(bgGreenColor).withOpacity(0.23),
                                fillColor: Colors.transparent,
                                // fillColor: const Color.fromARGB(255, 190, 190, 190),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),

                                hintStyle: TextStyle(
                                  color: Color(blackColor).withOpacity(0.5),
                                  fontSize: 30,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                      // color: Color(0xff222222),
                                      color: Colors.transparent),
                                ),
                                contentPadding: const EdgeInsets.all(0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      Pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(150, 0),
                        backgroundColor: Color.fromARGB(255, 190, 190, 190),
                        padding: EdgeInsets.all(5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      "التالي",
                      style: TextStyle(
                          fontFamily: fontGoogleCairo,
                          fontSize: 20,
                          color: Color(blackColor),
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(darkGreenColor),
      ),
      margin: const EdgeInsets.all(5),
      child: TextButton(
        onPressed: () {
          setState(() {
            showModalHourseAndGPA(context);
          });
        },
        child: const Text(
          "المعدل السابق",
          style: TextStyle(
            color: Colors.white,
            fontFamily: fontGoogleCairo,
          ),
        ),
      ),
    );
  }
}
