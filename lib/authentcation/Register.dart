import 'package:flutter/material.dart';
import 'package:flutter_app1/authentcation/Login.dart';
import 'package:flutter_app1/custom/customBack.dart';
import 'package:flutter_app1/myData.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';

class Register extends StatefulWidget {
  @override
  _Register createState() => _Register();
}

class _Register extends State<Register> {
  var show_pass = true;
  Future register_() async {
    var url = Uri.http(ipconfig, 'register.php', {'q': '{http}'});
    var response = await http.post(url, body: {
      "username": controllerUsernameregister.text.toString(),
      "password": controllerPasswordregister.text.toString(),
      "email": controllerEmailregister.text.toString(),
    });
    var data = json.decode(response.body);
    if (data == "Error") {
      toastMsg("اسم المستخدم مسخدم سابقا");
    } else {
      toastMsgSuccess("تم إنشاء الحساب بنجاح");
      Push(context, Login());
    }
  }

  @override
  final formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: CustomBack(onPress: () {
          Pop(context);
        }),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Color(darkBlueColor),
      body: Form(
        key: formKey,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: const Image(
                    image: AssetImage("images/Logo Design important.png"),
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    const Text(
                      "إنشاء حساب جديد",
                      style: TextStyle(
                        fontFamily: fontGoogleCairo,
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(darkGreenColor)),
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: const [
                      CustomControllerUsernameregister(),
                      SizedBox(
                        height: 30,
                      ),
                      CustomControllerEmailregister(),
                      SizedBox(
                        height: 30,
                      ),
                      CustomControllerPasswordregister(),
                      SizedBox(
                        height: 30,
                      ),
                      CustomControllerConfPassword(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomBtn(
                  title: "إنشاء الحساب",
                  onPress: () {
                    setState(() {
                      if (controllerUsernameregister.text == "" &&
                          controllerEmailregister.text == "" &&
                          controllerPasswordregister.text == "" &&
                          controllerConfPassword.text == "") {
                        toastMsg("أدخل بيانات");
                      } else {
                        final isValidForm = formKey.currentState!.validate();
                        if (isValidForm) {
                          register_();
                        }
                        controllerUsernameregister.text = "";
                        controllerEmailregister.text = "";
                        controllerPasswordregister.text = "";
                        controllerConfPassword.text = "";
                      }
                    });
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
