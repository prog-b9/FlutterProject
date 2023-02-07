import 'package:flutter/material.dart';
import 'package:flutter_app1/authentcation/Register.dart';
import 'package:flutter_app1/authentcation/Splash.dart';
import 'package:flutter_app1/custom/customBack.dart';
import 'package:flutter_app1/custom/customBtnGoogle.dart';
import 'package:flutter_app1/myData.dart';
import 'package:flutter_app1/pages/homePage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => new _Login();
}

class _Login extends State<Login> {
  // function save token
  saveToken(String user, int id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("storage", user);
    prefs.setInt("storageId", id);
    print(prefs.getString("storage"));
    print(prefs.getInt("storageId"));
  }

  Future readToken() async {
    // WidgetsFlutterBinding.ensureInitialized();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString("storage");
    if (prefs.getString("storage") != null) {
      // ignore: use_build_context_synchronously
      Push(context, const Homepage());
    }
  }

  Future loginWithgoogle() async {
    dataGoogle = await GoogleSignIn().signIn();

    whatDoseLoginGoogleOrPhp = 1;
    print(dataGoogle);
    // print(dataGoogle.email);
    // print(dataGoogle.);
    emailGoogle = dataGoogle!.email;
    usernameGoogle = dataGoogle!.displayName;
    avatarGoogle = dataGoogle!.photoUrl;
    saveToken(usernameGoogle, whatDoseLoginGoogleOrPhp);
    funchideOrShowLogout();

    Push(context, const Homepage());

    // print(dataGoogle.);
    // user == null ? "":  _user!.photoUrl;
  }

  void error(BuildContext context, String error) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(error),
        action: SnackBarAction(
            label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  final formKey = GlobalKey<FormState>();

// Function Login
  Future login() async {
    var url = Uri.http(ipconfig, 'login.php', {'q': '{http}'});
    var response = await http.post(url, body: {
      "username": controllerUsernamelogin.text,
      "password": controllerPasswordlogin.text,
    });
    var data = json.decode(response.body);
    if (data.toString() == "Success") {
      // controllerUsernameedit.text = controllerUsernamelogin.text;
      // controllerPasswordedit.text = controllerPasswordlogin.text;
      username = "";
      // userdata = true;
      usernameLogin = controllerUsernamelogin.text;
      whatDoseLoginGoogleOrPhp = 0;

      saveToken(usernameLogin, whatDoseLoginGoogleOrPhp);
      funchideOrShowLogout();

      toastMsgSuccess("تم تسحيل الدخول بنجاح");

      Push(context, Homepage());
    } else {
      // userdata = false;
      toastMsg("اسم المستخدم او الرقم السري غير صحيح");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   centerTitle: true,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      backgroundColor: Color(darkBlueColor),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 30,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      // ignore: prefer_const_constructors
                      child: Image(
                        // image: NetworkImage(avatarGoogle),
                        image: const AssetImage(
                            "images/Logo Design important.png"),
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
                          "تسجيل دخول",
                          style: TextStyle(
                            fontFamily: fontGoogleCairo,
                            fontSize: 30,
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
                      // height: 200,
                      child: Column(
                        children: const [
                          CustomControllerUsernamelogin(),
                          SizedBox(
                            height: 30,
                          ),
                          CustomControllerPasswordlogin(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    CustomBtn(
                      title: "تسجيل دخول",
                      onPress: () {
                        setState(() {
                          if (controllerUsernamelogin.text == "" &&
                              controllerPasswordlogin.text == "") {
                            toastMsg("أدخل بيانات");
                          } else {
                            final isValidForm =
                                formKey.currentState!.validate();
                            if (isValidForm) {
                              login();
                            }
                            // controllerUsernamelogin.text = "";
                            // controllerPasswordlogin.text = "";
                          }
                        });
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Push(context, Register());
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Color(lightGreenColor),
                          ),
                          child: const Text(
                            'نعم , حساب جديد',
                            style: TextStyle(fontFamily: "Cairo"),
                          ),
                        ),
                        const Text(
                          'لاتمتلك حساب؟ ',
                          style: TextStyle(
                              color: Colors.white, fontFamily: fontGoogleCairo),
                        ),
                      ],
                    ),
                    CustomBtnGoogle(
                      title: "Sign In Google",
                      onPress: () {
                        setState(() {
                          loginWithgoogle();
                        });
                      },
                      img: "images/google.png",
                    ),
                    CustomBtnGoogle(
                      title: "الدخول كضيف",
                      onPress: () {
                        setState(() {
                          hideOrShowLogout = false;
                          Push(context, Homepage());
                        });
                      },
                      img: "images/a geust.png",
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
