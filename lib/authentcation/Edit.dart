import 'package:flutter/material.dart';
import 'package:flutter_app1/authentcation/Setting.dart';
import 'package:flutter_app1/custom/customBack.dart';
import 'package:flutter_app1/myData.dart';
import 'package:flutter_app1/pages/homePage.dart';
import 'package:flutter_app1/authentcation/Login.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';

class Edit extends StatefulWidget {
  @override
  _Edit createState() => _Edit();
}

class _Edit extends State<Edit> {
  Future editdata() async {
    var url = Uri.http(ipconfig, 'editdata.php', {'q': '{http}'});
    var response = await http.post(url, body: {
      "username": controllerUsernameedit.text,
      "password": controllerPasswordedit.text,
      "email": controllerEmailedit.text,
    });
    var data = json.decode(response.body);
    if (data == "Success") {
      toastMsgSuccess("تم تعديل البيانات");
      // ignore: use_build_context_synchronously
      Push(context, const Homepage());
    }
    // else {
    //   Fluttertoast.showToast(
    //     backgroundColor: Colors.green,
    //     textColor: Colors.white,
    //     msg: 'Registration Successful',
    //     toastLength: Toast.LENGTH_SHORT,
    //   );
    // }
  }

  @override
  final formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBack(onPress: () {
          Pop(context);
        }),
        title: const Text(
          "تعديل",
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
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(darkGreenColor)),
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(),
                            Container(
                              margin:
                                  const EdgeInsets.only(right: 8, bottom: 5),
                              child: const Text(
                                "اسم المستخدم",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: fontGoogleCairo,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const CustomControllerUsernameedit(),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(),
                            Container(
                              margin:
                                  const EdgeInsets.only(right: 8, bottom: 5),
                              child: const Text(
                                "الايميل",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: fontGoogleCairo,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const CustomControllerEmailedit(),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(),
                            Container(
                              margin:
                                  const EdgeInsets.only(right: 8, bottom: 5),
                              child: const Text(
                                "الرقم السري",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: fontGoogleCairo,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const CustomControllerPasswordedit(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomBtn(
                    title: "تعديل",
                    onPress: () {
                      setState(() {
                        final isValidForm = formKey.currentState!.validate();
                        if (isValidForm) {
                          if (controllerPasswordedit.text != pass ||
                              controllerEmailedit.text != email) {
                            editdata();
                          } else {
                            toastMsg("لم تجري اي تغييرات");
                          }
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
