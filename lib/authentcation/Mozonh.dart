import 'package:flutter/material.dart';
import 'package:flutter_app1/custom/customBack.dart';
import 'package:flutter_app1/myData.dart';
import 'package:flutter_app1/pages/aboutAcceptanceRates.dart';
import 'package:flutter_app1/pages/allUnversity.dart';
import 'package:flutter_app1/pages/homePage.dart';

class Mozonh extends StatefulWidget {
  // const MyHomePage({super.key, required this.title});
  @override
  _Mozonh createState() => _Mozonh();
}

class _Mozonh extends State<Mozonh> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: CustomBack(onPress: () {
          Pop(context);
        }),
        title: const Text(
          "حساب النسبة الموزونة",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontFamily: fontGoogleCairo,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Color(darkBlueColor),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(darkGreenColor)),
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: const [
                      CustomControllerHighSchool(),
                      SizedBox(
                        height: 30,
                      ),
                      CustomControllerCapacity(),
                      SizedBox(
                        height: 30,
                      ),
                      CustomControllerAttainment(),
                      SizedBox(
                        height: 30,
                      ),
                      CustomControllerStep(),
                    ],
                  ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 25,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomBtn(
                      title: "حفظ",
                      onPress: () {
                        setState(() {
                          controllerMazonah(context);
                        });
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(darkGreenColor),
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            controllerHighSchool.text = "";
                            controllerCapacity.text = "";
                            controllerAttainment.text = "";
                            controllerStep.text = "";
                            resultMazonahRelation = 0;
                            resultMazonahScience = 0;
                            resultMazonahHelthy = 0;
                          });
                        },
                        icon: const Icon(Icons.refresh_rounded),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Push(context, AboutRates());
        },
        label: const Text(
          "نبذة عن نسب القبول",
          style: TextStyle(fontFamily: fontGoogleCairo),
        ),
        icon: const Icon(
          Icons.question_mark_rounded,
        ),
        backgroundColor: const Color.fromARGB(78, 54, 244, 219),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
