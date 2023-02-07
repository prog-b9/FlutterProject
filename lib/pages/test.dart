import 'dart:convert';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_app1/myData.dart';

import '../custom/customAllUnversity.dart';
import 'allMajors.dart';
import 'package:http/http.dart' as http;

class Test extends StatefulWidget {
  Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Color(darkBlueColor),
      body: Center(
        child: Container(
          width: 120,
          child: TextFormField(
            controller: controllerCounterMaterialsBeforeGrade,
            onChanged: (value) {
              setState(() {
                // List arr = [];
                // List arrOnther = [];
                // var cut = value.split("");

                // if (cut.isEmpty) {
                //   return null;
                // } else {
                //   change = int.parse(cut.first); // it is num 5
                //   if (change > 5) {
                //     change = 5;
                //   }
                //   arr.add( change);
                //   if (arr[1] > 0) {
                //     arr.removeAt(1);
                //   }

                //   // arrOnther.insertAll(0, arr);

                //   // controllerCounterMaterialsBeforeGrade.text = arrOnther.join();

                //   print("cut All : ${arr.join()}");
                  // print("cut[0] : $change");
                  // arr.addAll([
                  //   change,
                  //   // cut.join()
                  // ]);
                  // double.parse(controllerCounterMaterialsBeforeGrade.text);

                  // print("array all  : " + arr.toString());
                  // print("join : " + arr.join());
                  // print("cut[0] : " + change.toString());
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
                // print(value);
              });
            },
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),

              // FilteringTextInputFormatter.digitsOnly
            ],
            style: const TextStyle(
              fontSize: 30,
              // height: 1,
              fontFamily: fontGoogleCairo,
              fontWeight: FontWeight.bold,
              color: Colors.white,
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
                borderSide: BorderSide(
                  color: Color(darkGreenColor),
                  width: 4,
                ),
                borderRadius: BorderRadius.circular(10),
              ),

              hintStyle: TextStyle(
                color: const Color(0xffffffff).withOpacity(0.4),
                fontSize: 30,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(darkGreenColor),
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
      ),

      // ListView.builder(
      //   itemCount: data.length,
      //   itemBuilder: (context, index) {
      //     print(index);
      //     return Padding(
      //       padding: EdgeInsets.all(30),
      //     );
      //   },
      // ),
    );
  }
}




  // List data = [];
  // Future GetDataUnversity() async {
  //   var responseUrl = "https://api.jsonserve.com/9g6ZK1";
  //   var response = await http.get(Uri.parse(responseUrl));
  //   var responseBody = await jsonDecode(response.body);

  //   if (response.statusCode == 200) {
  //     setState(() {
  //       data = responseBody;
  //     });
  //   }
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   GetDataUnversity();
  // }

 // Column(
          //   children: [
          //     Text(
          //       data[0]["kingSoud"]["data"]["majorTitleItemRatioHelthy"][index],
          //       style: TextStyle(color: Colors.white),
          //     ),
          //   ],
          // );