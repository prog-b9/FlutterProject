// myDAta

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/authentcation/Login.dart';
import 'package:flutter_app1/authentcation/Mozonh.dart';
import 'package:flutter_app1/authentcation/Setting.dart';
import 'package:flutter_app1/pages/aboutAcceptanceRates.dart';
import 'package:flutter_app1/pages/allUnversity.dart';
import 'package:flutter_app1/pages/homePage.dart';
import 'package:flutter_app1/pages/homePage.dart';
import 'package:flutter_app1/pages/question.dart';
import 'package:flutter_app1/pages/switchGPA.dart';
import 'package:fluttertoast/fluttertoast.dart';
// ignore: depend_on_referenced_packages
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

var mainColor = 0xff000000;
var lightGreenColor = 0xff48D8A4;
var darkGreenColor = 0xff276367;
var darkBlueColor = 0xff182e3c;
var bgGreenColor = 0xffDFCDCD;
var blackColor = 0xff222222;
var whiteWithLightBlueColor = 0xffCDF3FF;
const String fontGoogleCairo = 'Cairo';

// // This Is List For GridView
List countContentGrid = [
  {
    "img": "images/question.png",
    "title": "اختبار  تحديد المسار",
    "onPress": Question(),
  },
  {
    "img": "images/calculator.png",
    "title": "حساب النسبة الموزونة",
    "onPress": Mozonh(),
  },
  {
    "img": "images/calculatorIphone.png",
    "title": "حساب المعدل الجامعي",
    "onPress": SwitchGPA(),
  },
  {
    "img": "images/percent.png",
    "title": " نسب القبول في الجامعات",
    "onPress": AboutRates(),
  },
  {
    "img": "images/setting.png",
    "title": "الإعدادات",
    "onPress": Setting(),
  },
  {
    "img": "images/login.png",
    "title": "تسجيل دخول",
    "onPress": Login(),
  },
];

String WhoAreWe =
    "نحن طلاب كلية الاتصالات تخصص برمجيات أنشأنا هذ التطبيق لإستهداف خريجين الثانوي لتحديد مسارهم الجامعي   و التخصصات المناسبة لهم  ومعرفة نسب القبول تخصصات الجامعية بالرياض ومعرفة درجاته الموزونة النهائية ومعرفة الطالب الجامعي  معدلة الجامعي";

/** Strat => index
 * kink soud 0
 * emam 1
 * norah 2
 * CTI 3
 */

void toastMsg(String m) {
  Fluttertoast.showToast(
    backgroundColor: Colors.redAccent,
    textColor: Colors.white,
    msg: "             $m             ",
    toastLength: Toast.LENGTH_SHORT,
    webShowClose: false,
    fontSize: 17,
  );
}

void toastMsgSuccess(String m) {
  Fluttertoast.showToast(
    backgroundColor: Colors.green,
    textColor: Colors.white,
    msg: "             $m              ",
    toastLength: Toast.LENGTH_SHORT,
    fontSize: 17,
  );
}

// List data = [];
var majorTitleOfLength =
    data[counterUnversity]["id"]["data"]["majorTitle"]; // Now 3

var counterUnversity = 0;
// shardePrefernces => localStorage

var whatDoseLoginGoogleOrPhp;
// Auth PHP
var idAuth;
var storage;
var mode;
var color;

// auth Google
var dataGoogle;
var usernameGoogle;
var emailGoogle;
var avatarGoogle;

// Auth All
var usernameGoogleOrPhp;
var emailGoogleOrPhp;
var passGoogleOrPhp;
var avatarGoogleOrPhp;

List sideBarItem = [
  {
    "nameItem": "الصفحةالرئيسة",
    "iconItem": const Icon(
      Icons.home,
      color: Colors.white,
    ),
    "onPress": const Homepage(),
  },
  {
    "nameItem": "اختبار تحديد المسار",
    "iconItem": const Icon(
      Icons.question_answer_rounded,
      color: Colors.white,
    ),
    "onPress": Question(),
  },
  {
    "nameItem": "حساب النسبة الموزونة",
    "iconItem": const Icon(
      Icons.calculate,
      color: Colors.white,
    ),
    "onPress": Mozonh(),
  },
  {
    "nameItem": "حساب المعدل الجامعي ",
    "iconItem": const Icon(
      Icons.calculate,
      color: Colors.white,
    ),
    "onPress": SwitchGPA(),
  },
  {
    "nameItem": "تسجيل الدخول",
    "iconItem": const Icon(
      Icons.login_outlined,
      color: Colors.white,
    ),
    "onPress": Login(),
  },
  {
    "nameItem": "الإعدادت",
    "iconItem": const Icon(
      Icons.settings,
      color: Colors.white,
    ),
    "onPress": Setting(),
  },
];

bool showOrHideBeforeGradeOrTimer = false;
//Start Section Garade

List<dynamic> gradesList = [
  "A+",
  "A",
  "B+",
  "B",
  "C+",
  "C",
  "D+",
  "D",
  "F",
];

List TimerList = [
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
];
var counterOfCustomContainerGrade = 0;
var counterOfCustomContainerGradeIndex = 0;
// ignore: prefer_typing_uninitialized_variables
// my Choose
var resultGPAnum;
var resultGPAchar;
var resultGPAtitle;

// choose List  [4.5,3.4,4.4] and summation
List<dynamic> chooseList = [];
List<dynamic> chooseListOther = [];

dynamic ww = 0;
double ee = 0;
dynamic countMaterialFromZeroToEnd = 0;
List ListMaterialFromZeroToEnd = [];

// counter for chooseList
double countChooseList = 0;
double countChooseListRemove = 0;
bool isVisCutomGrade = false;

// For Timer
var chooseTimer;

List chooseListTimer = [];
// counter for chooseList
dynamic countChooseListTimer = 0;
// Check
List checkGrade = [];
List checkTimer = [];

var change; // this is var filter input hours befores

// This Is FUnction For grades from (4.74) to (A)
void changesGradeFromNumToChar() {
  for (var i = 0; i < chooseList.length; i++) {
    if (chooseList[i] == 5) {
      chooseList[i] = "A+";
    } else if (chooseList[i] == 4.75) {
      chooseList[i] = "A";
    } else if (chooseList[i] == 4.5) {
      chooseList[i] = "B+";
    } else if (chooseList[i] == 4) {
      chooseList[i] = "B";
    } else if (chooseList[i] == 3.5) {
      chooseList[i] = "C+";
    } else if (chooseList[i] == 3) {
      chooseList[i] = "C";
    } else if (chooseList[i] == 2.5) {
      chooseList[i] = "D+";
    } else if (chooseList[i] == 2) {
      chooseList[i] = "D";
    } else if (chooseList[i] == 1) {
      chooseList[i] = "F";
    }
  }
}

void clears() {
  // ListMaterialFromZeroToEnd.clear();
  // controllerCounterMaterials.text = "";
  resultGPAnum = 0;
  countChooseList = 0;
  countChooseListTimer = 0;
  chooseList.clear();
  chooseListTimer.clear();
  chooseListOther.clear();
  checkGrade.clear();
  checkTimer.clear();
}

TextEditingController controllerTimer = TextEditingController();

// Data GPA
// ignore: non_constant_identifier_names
var whatChooseTermOrCumulative;

class GPA {
  var logo;
  var term;
  var cumulative;
  GPA({required this.logo, required this.term, required this.cumulative});
}

// ignore: unnecessary_new
var objGPA = new GPA(logo: "logo GPA", term: "الفصلي", cumulative: "التراكمي");

// Navigator (pop , push) .

// ignore: non_constant_identifier_names
void Pop(context) {
  Navigator.of(context).pop();
}

// ignore: non_constant_identifier_names
void Push(context, Widget pageName) {
  // Navigator.push( context, PageTransitionsBuilder());
  Navigator.push(
      context,
      PageTransition(
          type: PageTransitionType.rightToLeftWithFade, child: pageName));
}

// widget Button submit
class CustomBtn extends StatefulWidget {
  CustomBtn({
    super.key,
    required this.title,
    required this.onPress,
  });

  var title;
  Function() onPress;

  @override
  State<CustomBtn> createState() => _CustomBtnState();
}

class _CustomBtnState extends State<CustomBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: widget.onPress,
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(270, 0),
            backgroundColor: Color(darkGreenColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
        child: Text(
          widget.title,
          style: TextStyle(
            fontSize: 23,
            fontFamily: fontGoogleCairo,
          ),
        ),
      ),
    );
  }
}

// Strat  data for Athentcation (username, email ,password)
//
//
//
//

String ipconfig = "172.18.1.52";
String api = "https://api.jsonserve.com/_-4Qng";

TextEditingController controllerUsernamelogin = TextEditingController();
TextEditingController controllerUsernameregister = TextEditingController();
TextEditingController controllerUsernameedit = TextEditingController();
///////////////////////////////////////////////////////////////////
TextEditingController controllerPasswordlogin = TextEditingController();
TextEditingController controllerPasswordregister = TextEditingController();
TextEditingController controllerPasswordedit = TextEditingController();
///////////////////////////////////////////////////////////////////
TextEditingController controllerEmailregister = TextEditingController();
TextEditingController controllerEmailedit = TextEditingController();
//////////////////////////////////////////////////////////////////
TextEditingController controllerConfPassword = TextEditingController();
// ignore: non_constant_identifier_names
var show_pass = true;

var hideOrShowLogout;

String username = "";
// this var for user pageHome
String usernameLogin = "";
var pass;
var email;

// ///////////////////////////
// Start Controller Login
// //////////////////////////
class CustomControllerUsernamelogin extends StatelessWidget {
  const CustomControllerUsernamelogin({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          toastMsg("الرجاء تعبئة اسم المستخدم ");
          return "";
        } else {
          return null;
        }
      },
      controller: controllerUsernamelogin,
      style: const TextStyle(
          fontFamily: fontGoogleCairo, color: Color(0xff222222)),
      textAlign: TextAlign.end,

      // textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        filled: true,
        hintText: "اسم المستخدم",
        fillColor: Color(bgGreenColor).withOpacity(0.23),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        hintStyle: const TextStyle(
          color: Color(0xff222222),
          fontFamily: fontGoogleCairo,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
              // color: Color(0xff222222),
              color: Colors.transparent),
        ),
        contentPadding: const EdgeInsets.only(right: 10),
      ),
    );
  }
}

class CustomControllerPasswordlogin extends StatefulWidget {
  const CustomControllerPasswordlogin({super.key});

  @override
  State<CustomControllerPasswordlogin> createState() =>
      _CustomControllerPasswordState_login();
}

class _CustomControllerPasswordState_login
    extends State<CustomControllerPasswordlogin> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          toastMsg("الرجاء تعبئة الرقم السري ");
          return "";
        } else {
          return null;
        }
      },
      controller: controllerPasswordlogin,
      style: const TextStyle(
        fontFamily: fontGoogleCairo,
        color: Color(0xff222222),
      ),
      obscureText: show_pass,
      textAlign: TextAlign.end,
      // textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        //
        errorStyle: const TextStyle(
          color: Colors.red,
        ),

        filled: true,
        hintText: "الرقم السري",
        prefixIcon: IconButton(
          onPressed: () {
            setState(() {
              show_pass = !show_pass;
            });
          },
          color: const Color(0xff222222),
          icon: show_pass
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
        ),

        fillColor: Color(bgGreenColor).withOpacity(0.23),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),

        hintStyle: const TextStyle(
          color: Color(0xff222222),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
              // color: Color(0xff222222),
              color: Colors.transparent),
        ),
        contentPadding: const EdgeInsets.only(right: 10),
      ),
    );
  }
}

// ///////////////////////////
// End Controller Login
// //////////////////////////

// ///////////////////////////
// Start Controller Register
// //////////////////////////

class CustomControllerUsernameregister extends StatelessWidget {
  const CustomControllerUsernameregister({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          toastMsg("الرجاء تعبئة اسم المستخدم ");
          return "";
        } else {
          return null;
        }
      },
      controller: controllerUsernameregister,
      style: const TextStyle(
          fontFamily: fontGoogleCairo, color: Color(0xff222222)),
      textAlign: TextAlign.end,

      // textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        filled: true,
        hintText: "اسم المستخدم",
        fillColor: Color(bgGreenColor).withOpacity(0.23),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        hintStyle: const TextStyle(
          color: Color(0xff222222),
          fontFamily: fontGoogleCairo,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
              // color: Color(0xff222222),
              color: Colors.transparent),
        ),
        contentPadding: const EdgeInsets.only(right: 10),
      ),
    );
  }
}

class CustomControllerEmailregister extends StatelessWidget {
  const CustomControllerEmailregister({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // validator: (email) => email != null && !EmailValidator.validate(email)
      //     ? "                     الرجاء ادخال ايميل صحيح "
      //     : null,
      validator: (value) {
        if (value != null && !EmailValidator.validate(value)) {
          toastMsg(" الرجاء تعبئة الإيميل او أدخلة بشكل صحيح");
          return "";
        } else {
          return null;
        }
      },
      controller: controllerEmailregister,
      style: const TextStyle(
          fontFamily: fontGoogleCairo, color: Color(0xff222222)),
      textAlign: TextAlign.end,
      // textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        filled: true,
        hintText: "الإيميل",
        fillColor: Color(bgGreenColor).withOpacity(0.23),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        hintStyle: const TextStyle(
          color: Color(0xff222222),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
              // color: Color(0xff222222),
              color: Colors.transparent),
        ),
        contentPadding: const EdgeInsets.only(right: 10),
        labelStyle:
            const TextStyle(color: Colors.white, fontFamily: fontGoogleCairo),
      ),
    );
  }
}

class CustomControllerPasswordregister extends StatefulWidget {
  const CustomControllerPasswordregister({super.key});

  @override
  State<CustomControllerPasswordregister> createState() =>
      _CustomControllerPasswordState_register();
}

class _CustomControllerPasswordState_register
    extends State<CustomControllerPasswordregister> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          toastMsg("الرجاء تعبئة الرقم السري ");
          return "";
        } else {
          return null;
        }
      },
      controller: controllerPasswordregister,
      style: const TextStyle(
        fontFamily: fontGoogleCairo,
        color: Color(0xff222222),
      ),
      obscureText: show_pass,
      textAlign: TextAlign.end,
      // textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        //
        errorStyle: const TextStyle(
          color: Colors.red,
        ),

        filled: true,
        hintText: "الرقم السري",
        prefixIcon: IconButton(
          onPressed: () {
            setState(() {
              show_pass = !show_pass;
            });
          },
          color: const Color(0xff222222),
          icon: show_pass
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
        ),

        fillColor: Color(bgGreenColor).withOpacity(0.23),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),

        hintStyle: const TextStyle(
          color: Color(0xff222222),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
              // color: Color(0xff222222),
              color: Colors.transparent),
        ),
        contentPadding: const EdgeInsets.only(right: 10),
      ),
    );
  }
}

class CustomControllerConfPassword extends StatefulWidget {
  const CustomControllerConfPassword({super.key});

  @override
  State<CustomControllerConfPassword> createState() =>
      _CustomControllerConfPasswordState();
}

class _CustomControllerConfPasswordState
    extends State<CustomControllerConfPassword> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (controllerConfPassword.text == "") {
          toastMsg("الرجاء تعبئة أعادة الرقم السري");
          return "";
        } else {
          if (controllerPasswordregister.text != controllerConfPassword.text) {
            toastMsg("الرقم السري غير متطابق");
            return "";
          } else {
            return null;
          }
        }
      },
      controller: controllerConfPassword,
      style: const TextStyle(
        fontFamily: fontGoogleCairo,
        color: Color(0xff222222),
      ),
      obscureText: show_pass,
      textAlign: TextAlign.end,
      decoration: InputDecoration(
        errorStyle: const TextStyle(
          color: Colors.red,
        ),
        filled: true,
        hintText: "إعادة الرقم السري",
        prefixIcon: IconButton(
          onPressed: () {
            setState(() {
              show_pass = !show_pass;
            });
          },
          color: const Color(0xff222222),
          icon: show_pass
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
        ),
        fillColor: Color(bgGreenColor).withOpacity(0.23),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        hintStyle: const TextStyle(
          color: Color(0xff222222),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
              // color: Color(0xff222222),
              color: Colors.transparent),
        ),
        contentPadding: const EdgeInsets.only(right: 10),
      ),
    );
  }
}
// ///////////////////////////
// End Controller Register
// //////////////////////////

// ///////////////////////////
// Start Controller Edit
// //////////////////////////
class CustomControllerUsernameedit extends StatelessWidget {
  const CustomControllerUsernameedit({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      controller: controllerUsernameedit,
      style: const TextStyle(
          fontFamily: fontGoogleCairo, color: Color(0xff222222)),
      textAlign: TextAlign.end,

      // textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        filled: true,
        hintText: "اسم المستخدم",
        fillColor: Color(bgGreenColor).withOpacity(0.23),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        hintStyle: const TextStyle(
          color: Color(0xff222222),
          fontFamily: fontGoogleCairo,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
              // color: Color(0xff222222),
              color: Colors.transparent),
        ),
        contentPadding: const EdgeInsets.only(right: 10),
      ),
    );
  }
}

class CustomControllerEmailedit extends StatelessWidget {
  const CustomControllerEmailedit({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value != null && !EmailValidator.validate(value)) {
          toastMsg(" الرجاء تعبئة الإيميل او أدخلة بشكل صحيح");
          return "";
        } else {
          return null;
        }
      },
      controller: controllerEmailedit,
      style: const TextStyle(
          fontFamily: fontGoogleCairo, color: Color(0xff222222)),
      textAlign: TextAlign.end,
      // textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        filled: true,
        hintText: "الإيميل",
        fillColor: Color(bgGreenColor).withOpacity(0.23),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        hintStyle: const TextStyle(
          color: Color(0xff222222),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
              // color: Color(0xff222222),
              color: Colors.transparent),
        ),
        contentPadding: const EdgeInsets.only(right: 10),
        labelStyle:
            const TextStyle(color: Colors.white, fontFamily: fontGoogleCairo),
      ),
    );
  }
}

class CustomControllerPasswordedit extends StatefulWidget {
  const CustomControllerPasswordedit({super.key});

  @override
  State<CustomControllerPasswordedit> createState() =>
      _CustomControllerPasswordState_edit();
}

class _CustomControllerPasswordState_edit
    extends State<CustomControllerPasswordedit> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          toastMsg("الرجاء تعبئة الرقم السري ");
          return "";
        } else {
          return null;
        }
      },
      controller: controllerPasswordedit,
      style: const TextStyle(
        fontFamily: fontGoogleCairo,
        color: Color(0xff222222),
      ),
      obscureText: show_pass,
      textAlign: TextAlign.end,
      // textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        //
        errorStyle: const TextStyle(
          color: Colors.red,
        ),

        filled: true,
        hintText: "الرقم السري",
        prefixIcon: IconButton(
          onPressed: () {
            setState(() {
              show_pass = !show_pass;
            });
          },
          color: const Color(0xff222222),
          icon: show_pass
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
        ),

        fillColor: Color(bgGreenColor).withOpacity(0.23),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),

        hintStyle: const TextStyle(
          color: Color(0xff222222),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
              // color: Color(0xff222222),
              color: Colors.transparent),
        ),
        contentPadding: const EdgeInsets.only(right: 10),
      ),
    );
  }
}

// ///////////////////////////
// End Controller Edit
// //////////////////////////

//
//
//
//
// End data for Athentcation (username, email ,password)
//
//

///////////////////////////////////////////////////////////

//
//
// Start the page Mozonah
//
//

// الثانوي
TextEditingController controllerHighSchool = TextEditingController();
//  القدرات
TextEditingController controllerCapacity = TextEditingController();
// التحصيلي
TextEditingController controllerAttainment = TextEditingController();
// step
TextEditingController controllerStep = TextEditingController();

// أحسب موزونتك أول  // موزونتك هي
bool firstAccountMozonahOnOrOff = false;

// highrSchool
var resultHighSchoolRelation;
var resultHighSchoolScience;
var resultHighSchoolHelthy;

// capacity
var resultCapacityRelation;
var resultCapacityScience;
var resultCapacityHelthy;

// attainment
var resultAttainmentRelation;
var resultAttainmentScience;
var resultAttainmentHelthy;

// Step
var resultStepRelation;
var resultStepScience;
var resultStepHelthy;

double resultMazonahRelation = 0;
double resultMazonahScience = 0;
double resultMazonahHelthy = 0;
double resultMazonah = 0;
//

TextEditingController controllerCounterMaterials = TextEditingController();
TextEditingController controllerCounterMaterialsBeforeGrade =
    TextEditingController();
TextEditingController controllerCounterMaterialsBeforeTimer =
    TextEditingController();

// Cumulative
var resultGPAnumAndcountChooseListTimer; // 52

var resultCountBeforeGradeAndCountBeforeTimer; // 217.25

var resultGradeAndTimerForTermAndCumulative; // 52 + 217.25 = 269.25

var resultTimerTermAndCumulative; // 16 + 55 = 71

var resultGPAnumCumulative; // 3.79

int countMaterial = 0;
List countMaterialList = [];

var resultGPA;

//////////////////////
///

class CustomControllerHighSchool extends StatefulWidget {
  const CustomControllerHighSchool({super.key});

  @override
  State<CustomControllerHighSchool> createState() =>
      _CustomControllerHighSchoolState();
}

class _CustomControllerHighSchoolState
    extends State<CustomControllerHighSchool> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controllerHighSchool,

      style: const TextStyle(
          fontFamily: fontGoogleCairo, color: Color(0xff222222)),
      textAlign: TextAlign.end,
      keyboardType: TextInputType.number,
      // textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        filled: true,
        hintText: "نسبة الثانوي",
        fillColor: Color(bgGreenColor).withOpacity(0.23),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        hintStyle: TextStyle(
          color: Color(0xff222222).withOpacity(0.6),
          fontFamily: fontGoogleCairo,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
              // color: Color(0xff222222),
              color: Colors.transparent),
        ),
        contentPadding: const EdgeInsets.only(right: 10),
      ),
    );
  }
}

class CustomControllerCapacity extends StatelessWidget {
  const CustomControllerCapacity({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controllerCapacity,
      style: const TextStyle(
          fontFamily: fontGoogleCairo, color: Color(0xff222222)),
      textAlign: TextAlign.end,
      keyboardType: TextInputType.number,

      // textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        filled: true,
        hintText: "نسبة القدرات",
        fillColor: Color(bgGreenColor).withOpacity(0.23),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        hintStyle: TextStyle(
          color: Color(0xff222222).withOpacity(0.6),
          fontFamily: fontGoogleCairo,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
              // color: Color(0xff222222),
              color: Colors.transparent),
        ),
        contentPadding: const EdgeInsets.only(right: 10),
      ),
    );
  }
}

class CustomControllerAttainment extends StatelessWidget {
  const CustomControllerAttainment({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controllerAttainment,
      style: const TextStyle(
          fontFamily: fontGoogleCairo, color: Color(0xff222222)),
      textAlign: TextAlign.end,
      keyboardType: TextInputType.number,

      // textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        filled: true,
        hintText: "نسبة التحصيلي",
        fillColor: Color(bgGreenColor).withOpacity(0.23),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        hintStyle: TextStyle(
          color: Color(0xff222222).withOpacity(0.6),
          fontFamily: fontGoogleCairo,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
              // color: Color(0xff222222),
              color: Colors.transparent),
        ),
        contentPadding: const EdgeInsets.only(right: 10),
      ),
    );
  }
}

class CustomControllerStep extends StatelessWidget {
  const CustomControllerStep({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controllerStep,
      style: const TextStyle(
          fontFamily: fontGoogleCairo, color: Color(0xff222222)),
      textAlign: TextAlign.end,
      keyboardType: TextInputType.number,

      // textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        filled: true,
        hintText: "(Step) نسبة ستيب ",
        fillColor: Color(bgGreenColor).withOpacity(0.23),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        hintStyle: TextStyle(
          color: Color(0xff222222).withOpacity(0.6),
          fontFamily: fontGoogleCairo,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
              // color: Color(0xff222222),
              color: Colors.transparent),
        ),
        contentPadding: const EdgeInsets.only(right: 10),
      ),
    );
  }
}

List data = [];

//
//
// End the page Mozonah
//
//
// final List data = [
//   {
//     "id": {
//       "unversityTitle": "جامعة الملك سعود",
//       "headerImg": "images/logo kingSoud.jpg",
//       "about":
//           "ينصب تركيز جامعة الملك سعود بالمقام الأول على جودة التعليم، والبحث العلمي وريادة الأعمال، من اجل إعداد وتهيئة خريجيها من خلال تنمية مهاراتهم وقدراتهم ",
//       "aboutRates": """
//           مسار الانساني :
//           - 50% الثانوي
//           - 50% القدرات

//           مسار العلمي :
//           -  30% الثانوي
//           -  30% القدرات
//           -  40% التحصيلي

//           مسار الصحي :
//           -  30% الثانوي
//           -  50% القدرات
//           -  20% التحصيلي

//             """,
//       "mazonah": {
//         "relation": [
//           0.5,
//           0.5,
//         ],
//         "science": [
//           0.3,
//           0.3,
//           0.4,
//         ],
//         "helthey": [
//           0.3,
//           0.5,
//           0.2,
//         ],
//       },
//       "data": {
//         "majorTitle": [
//           "مسار الصحي",
//           "مسار العلمي",
//           "مسار الإنساني",
//         ],
//         "majorImg": [
//           "images/logo medical-team.png",
//           "images/logo science.png",
//           "images/logo relation.png"
//         ],
//         "dataNameAndRatio": [
//           {
//             "majorTitleItemName": [
//               "طب الأسنان",
//               "طب العام",
//               "الصيدلة",
//               "العلوم الطبية",
//             ],
//             "majorTitleItemRatio": [
//               "94.76%",
//               "96.1%",
//               "92.0%",
//               "88.74%",
//             ]
//           },
//           {
//             "majorTitleItemName": [
//               "رياضيات",
//               "فيزياء",
//               "كيمياء",
//               "احياء الدقيقة",
//               "إحصاء",
//               "علوم الحاسب",
//               "تقنية المعلومات",
//               "نظم المعلومات",
//               "هندسة البرمجيات",
//               "كيمياء الحيوية",
//             ],
//             "majorTitleItemRatio": [
//               "89.85%",
//               "81.25%",
//               "80.0%",
//               "83.2%",
//               "91.35%",
//               "93.7%",
//               "94.5%",
//               "93.05%",
//               "95.75%",
//               "82.75%",
//             ],
//           },
//           {
//             "majorTitleItemName": [
//               "الإعلام",
//               "تاريخ",
//               "اللغة العربية",
//               "جغرافيا",
//               "علم الاجتماع",
//               "خدمة إجتماعية",
//               "اللغة الإنقليزية",
//               "دراسات إسلامية",
//               "علم نفس",
//             ],
//             "majorTitleItemRatio": [
//               "88.32%",
//               "78.75%",
//               "87.72%",
//               "87.58%",
//               "87.5%",
//               "87.5%",
//               "87.0%",
//               "87.6%",
//               "87.4%",
//             ],
//           }
//         ]
//       }
//     }
//   },
//   {
//     "id": {
//       "unversityTitle": "جامعة الإمام",
//       "headerImg": "images/logo emam2.png",
//       "about":
//           "جامعة الإمام محمد بن سعود الإسلامية هي من كبرى المؤسسات العلمية الحكومية الشاملة، تميزت بأنها بدأت مختصة في العلوم الإسلامية والإنسانية، ثم ​توسعت لتشمل مجالات العلوم والهندسة والطب؛ مواكبةً لتطور متطلبـات سـوق العمـل السعودي واحتياجاته",
//       "aboutRates": """
//       مسار الانساني :
//       - 45% الثانوي
//       - 55% القدرات

//       مسار العلمي :
//       -  30% الثانوي
//       -  30% القدرات
//       -  40% التحصيلي

//       مسار الصحي :
//       - الثانوي %20 شرط الا يقل عن  %90
//       - القدرات %20 شرط الا يقل عن  %85
//       - التحصيلي %40 شرط الا يقل عن  %85
//       - اختبار اللغة الانجليزية %10 شرط الا يقل عن  %70

//         """,
//       "mazonah": {
//         "relation": [
//           0.45,
//           0.55,
//         ],
//         "science": [
//           0.3,
//           0.3,
//           0.4,
//         ],
//         "helthey": [
//           0.2,
//           0.3,
//           0.4,
//           0.1,
//         ],
//       },
//       "data": {
//         "majorTitle": ["مسار الصحي", "مسار العلمي", "مسار الإنساني"],
//         "majorImg": [
//           "images/logo medical-team.png",
//           "images/logo science.png",
//           "images/logo relation.png"
//         ],
//         "dataNameAndRatio": [
//           {
//             "majorTitleItemName": ["لاتوجد نسب للتخصصات حالياً"],
//             "majorTitleItemRatio": [],
//           },
//           {
//             "majorTitleItemName": ["لاتوجد نسب للتخصصات حالياً"],
//             "majorTitleItemRatio": []
//           },
//           {
//             "majorTitleItemName": ["لاتوجد نسب للتخصصات حالياً"],
//             "majorTitleItemRatio": []
//           }
//         ]
//       }
//     }
//   },
//   {
//     "id": {
//       "unversityTitle": "جامعة نورة",
//       "headerImg": "images/logo norah.jpg",
//       "about":
//           "جامعة الأميرة نورة بنت عبد الرحمن تقع في مدينة الرياض. تم افتتاحها في عهد خادم الحرمين الشريفين الملك عبد الله بن عبد العزيز، وتعتبر أول جامعة في المملكة العربية السعودية خاصة للبنات، وتبلغ مساحتها 8 ملايين متر مربع. تم تغيير اسمها من جامعة الرياض للبنات لتصبح جامعة الأميرة نورة بنت عبد الرحمن للبنات.",
//       "aboutRates": """
//         مسار الانساني :
//         - 50% الثانوي
//         - 25% القدرات
//         - 25% التحصيلي

//         مسار العلمي :
//         -  30% الثانوي
//         -  30% القدرات
//         -  40% التحصيلي

//         مسار الصحي :
//         -  30% الثانوي
//         -  30% القدرات
//         -  40% التحصيلي

//         """,
//       "mazonah": {
//         "relation": [
//           0.5,
//           0.25,
//           0.25,
//         ],
//         "science": [
//           0.3,
//           0.3,
//           0.4,
//         ],
//         "helthey": [
//           0.3,
//           0.3,
//           0.4,
//         ],
//       },
//       "data": {
//         "majorTitle": ["مسار الصحي", "مسار العلمي", "مسار الإنساني"],
//         "majorImg": [
//           "images/logo medical-team.png",
//           "images/logo science.png",
//           "images/logo relation.png"
//         ],
//         "dataNameAndRatio": [
//           {
//             "majorTitleItemName": [
//               "الصحي العام",
//             ],
//             "majorTitleItemRatio": [
//               "91.14%",
//             ]
//           },
//           {
//             "majorTitleItemName": [
//               "علوم الحاسب",
//               "هندسة",
//               "تقنية المعلومات",
//               "نظم المعلومات",
//               "العلوم",
//             ],
//             "majorTitleItemRatio": [
//               "89.0%",
//               "94.18%",
//               "88.0%",
//               "87.0%",
//               "85.0%",
//             ]
//           },
//           {
//             "majorTitleItemName": [
//               "قانون",
//               "أدبي",
//               "تصماميم",
//               "لغات",
//               "خدمة إجتماعية",
//             ],
//             "majorTitleItemRatio": [
//               "89.2%",
//               "88.7%",
//               "88.7%",
//               "86.5%",
//               "86.0%",
//             ]
//           }
//         ]
//       }
//     }
//   },
//   {
//     "id": {
//       "unversityTitle": "كلية الاتصالات والمعلومات",
//       "headerImg": "images/logo cti.png",
//       "about":
//           "كلية الاتصالات و المعلومات بالرياض هي أحدى الكليات السعودية الحكومية التابعة للمؤسسة العلمة للتدريب التقني والمهني تقدم الكلية عدداً من البرامج المتميزة بأعلى معايير الجودة على المستوى الدبلوم والبكالوريس الصباحي والمسائي بهدف تخريج متدربيت تأهيلاً عاليًا لسد الحاجة في السوق العمل السعودي",
//       "aboutRates": """
//     مسار العلمي :
//     -  50% الثانوي
//     -  30% القدرات
//     -  20% التحصيلي

//       """,
//       "mazonah": {
//         "relation": [
//           0.0,
//           0.0,
//           0.0,
//         ],
//         "science": [
//           0.5,
//           0.3,
//           0.2,
//         ],
//         "helthey": [
//           0.0,
//           0.0,
//           0.0,
//         ],
//       },
//       "data": {
//         "majorTitle": ["مسار العلمي"],
//         "majorImg": [
//           "images/logo science.png",
//         ],
//         "dataNameAndRatio": [
//           {
//             "majorTitleItemName": ["لاتوجد نسب للتخصصات حالياً"],
//             "majorTitleItemRatio": []
//           },
//         ]
//       }
//     }
//   },
// ];

//////////////////////////////////////////////////////////////////////////////////////
///
final List dataAboutRates = [
  {
    "id": {
      "unversityTitle": "جامعة الملك سعود",
      "aboutRates": """
          مسار الانساني : 
          - 50% الثانوي
          - 50% القدرات

          مسار العلمي :
          -  30% الثانوي
          -  30% القدرات
          -  40% التحصيلي

          مسار الصحي :
          -  30% الثانوي
          -  50% القدرات
          -  20% التحصيلي

            """,
    }
  },
  {
    "id": {
      "unversityTitle": "جامعة الإمام",
      "aboutRates": """
      مسار الانساني : 
      - 45% الثانوي
      - 55% القدرات

      مسار العلمي :
      -  30% الثانوي
      -  30% القدرات
      -  40% التحصيلي

      مسار الصحي :
      - الثانوي %20 شرط الا يقل عن  %90
      - القدرات %20 شرط الا يقل عن  %85
      - التحصيلي %40 شرط الا يقل عن  %85
      - اختبار اللغة الانجليزية %10 شرط الا يقل عن  %70

        """,
    }
  },
  {
    "id": {
      "unversityTitle": "جامعة نورة",
      "aboutRates": """
        مسار الانساني : 
        - 50% الثانوي
        - 25% القدرات
        - 25% التحصيلي

        مسار العلمي :
        -  30% الثانوي
        -  30% القدرات
        -  40% التحصيلي

        مسار الصحي :
        -  30% الثانوي
        -  30% القدرات
        -  40% التحصيلي

        """,
    }
  },
  {
    "id": {
      "unversityTitle": "كلية الاتصالات والمعلومات",
      "aboutRates": """
    مسار العلمي :
    -  50% الثانوي
    -  30% القدرات
    -  20% التحصيلي

      """,
    }
  },
];

void controllerMazonah(BuildContext context) {
  if (controllerHighSchool.text == "" &&
      controllerCapacity.text == "" &&
      controllerAttainment.text == "" &&
      controllerStep.text == "") {
    toastMsg("أدخل جميع النسب");
  } else {
    if (controllerHighSchool.text == "") {
      toastMsg("أدخل نسبة الثانوي");
    } else {
      if (controllerCapacity.text == "") {
        toastMsg("أدخل نسبة القدرات");
      } else {
        if (controllerAttainment.text == "") {
          toastMsg("أدخل نسبة التحصيلي");
        } else {
          if (controllerStep.text == "") {
            toastMsg("اذا لم يكن لديك ستيب ضع 0");
          } else {
            Push(context, AllUnversity());

            Fluttertoast.showToast(
              backgroundColor: Colors.green,
              textColor: Colors.white,
              msg: "تم أدخال النسب",
              toastLength: Toast.LENGTH_SHORT,
              fontSize: 17,
            );
          }
        }
      }
    }
  }
}

//
//
// section question
//
//

List answers = [
  "يعجبني بشدة",
  "يعجبني",
  "محايد",
  "لم يعجبني",
  "لم يعجبني بشدة",
];

String myChooseAnswer = "";

// List questionList = [
//   // section helthy
//   {
//     "question":
//         "أنا مهتم بالعمل مع المرضى ، ولدي إحساس قوي بالمسؤولية وحكم سليم",
//     "id": 0,
//   },
//   {
//     "question":
//         "لدي ذاكرة كبيرة ولدي القدرة على التعرف على المبادئ العامة في مواقف معينة",
//     "id": 0,
//   },
//   {
//     "question": "تحب العمل في المعامل الطبية ",
//     "id": 0,
//   },
//   {
//     "question": "تحب العمل في مجال الطب ",
//     "id": 0,
//   },
//   {
//     "question":
//         "أستمتع كثيراً بالعمل اليدوي والمشاركة ومشاهدة العمليات الجراحة",
//     "id": 0,
//   },
//   {
//     "question": "أستمتع بالجلوس لفترات طويلة مع المريض وسماع جميع شكاويه",
//     "id": 0,
//   },
//   {
//     "question": "احب العمل تحت المجهر فقط ومشاهدة العينات ودراستها",
//     "id": 0,
//   },
//   {
//     "question": "أنا صبور ونشط ، وأحب العمل مع الأطفال",
//     "id": 0,
//   },
//   {
//     "question": "أنا مهتم بالعلاج الطبيعي",
//     "id": 0,
//   },
//   {
//     "question": "احب الدراسة لسنوات طويلة ",
//     "id": 0,
//   },
//   // section Ssinces
//   {
//     "question": "أنا جيد في التعامل مع الأرقام ولدي خيال إبداعي",
//     "id": 1,
//   },
//   {
//     "question": "أنا جيد في تحليل البيانات ومقارنتها وتفسيرها",
//     "id": 1,
//   },
//   {
//     "question": "أنا أستمتع بالتعلم عن الكائنات الحية",
//     "id": 1,
//   },
//   {
//     "question": "أنا مهتم بالجرافيك و / أو تصميم الويب",
//     "id": 1,
//   },
//   {
//     "question": "هل تحب البرمجة وتصميم الالعاب ",
//     "id": 1,
//   },
//   {
//     "question": "احب التعامل مع المواد الكيميائية ",
//     "id": 1,
//   },
//   {
//     "question": "هل يمكنك تصليح اعطال لاجهزة الحاسوب ",
//     "id": 1,
//   },
//   {
//     "question": "هل تحب  أعمال تقنية و الحاسوب  ",
//     "id": 1,
//   },
//   {
//     "question": "هل يمكنك فهم واستيعاب الأسس الفيزيائية في نظام جهاز معين ",
//     "id": 1,
//   },
//   {
//     "question": "هل تفضل المسائل الرياضية والحسابات ",
//     "id": 1,
//   },
//   // section relation
//   {
//     "question": "أنا مهتم بالقانون والنقاش والحكومة والسياسة",
//     "id": 2,
//   },
//   {
//     "question":
//         "لدي قدرة لفظية قوية وأستمتع بالتعرف على الثقافات والحضارات الأخرى من خلال اللغة والأدب",
//     "id": 2,
//   },
//   {
//     "question": "التأثير على الاخرين ومحاولة تغيير رأيهم",
//     "id": 2,
//   },
//   {
//     "question": "كتابة وصياغة تقارير وتلخيصات ومقالات",
//     "id": 2,
//   },
//   {
//     "question": "احب الاعمال الصحفية ",
//     "id": 2,
//   },
//   {
//     "question": "هل تحب قراءة قصص أدبية",
//     "id": 2,
//   },
//   {
//     "question": "هل تحب ادوار المخرج التلفزيوني ",
//     "id": 2,
//   },
//   {
//     "question": "هل تهتم بالفنون اليدوية مثل الرسم ",
//     "id": 2,
//   },
//   {
//     "question": "هل تحب  أعمال ادارية ",
//     "id": 2,
//   },
//   {
//     "question": "هل تهتم بالتواريخ  والجغرافيا",
//     "id": 2,
//   },
// ];

int counterNumberLimetQuestion = 0;

List questionList = [
  // section helthy
  {
    "question":
        "أنا مهتم بالعمل مع المرضى ، ولدي إحساس قوي بالمسؤولية وحكم سليم",
    "id": 0,
  },

  {
    "question": "تحب العمل في المعامل الطبية ",
    "id": 0,
  },

  {
    "question":
        "أستمتع كثيراً بالعمل اليدوي والمشاركة ومشاهدة العمليات الجراحة",
    "id": 0,
  },

  {
    "question": "احب العمل تحت المجهر فقط ومشاهدة العينات ودراستها",
    "id": 0,
  },
  {
    "question": "أنا صبور ونشط ، وأحب العمل مع الأطفال",
    "id": 0,
  },

  {
    "question": "هل تحب البرمجة وتصميم الالعاب ",
    "id": 1,
  },
  {
    "question": "احب التعامل مع المواد الكيميائية ",
    "id": 1,
  },

  {
    "question": "هل تحب  أعمال تقنية و الحاسوب",
    "id": 1,
  },
  {
    "question": "هل يمكنك فهم واستيعاب الأسس الفيزيائية في نظام جهاز معين ",
    "id": 1,
  },
  {
    "question": "هل تفضل المسائل الرياضية والحسابات ",
    "id": 1,
  },

  {
    "question":
        "لدي قدرة لفظية قوية وأستمتع بالتعرف على الثقافات والحضارات الأخرى من خلال اللغة والأدب",
    "id": 2,
  },
  {
    "question": "التأثير على الاخرين ومحاولة تغيير رأيهم",
    "id": 2,
  },
  {
    "question": "كتابة وصياغة تقارير وتلخيصات ومقالات",
    "id": 2,
  },

  {
    "question": "هل تهتم بالفنون اليدوية مثل الرسم ",
    "id": 2,
  },
  {
    "question": "هل تحب  أعمال ادارية ",
    "id": 2,
  },
];

// this counter for question
int counterQuestionList = 0;

// this counter for LeainerPercent from 1 to 30
int counterQuestionListPercent = 0;

// counters answers
var selecetedAnswers = 0;
dynamic counterResultQuestionHelthy = 0;
dynamic counterResultQuestionScience = 0;
dynamic counterResultQuestionRelation = 0;
List ListResultQuestionHelthy = [];
List ListResultQuestionScience = [];
List ListResultQuestionRelation = [];

// res = 0.35 || 0.9
// var resultQuestionHelthy = counterResultQuestionHelthy / 20;
// var resultQuestionScience = counterResultQuestionScience / 20;
// var resultQuestionRelation = counterResultQuestionRelation / 20;
double resultQuestionHelthy = 0.0;
double resultQuestionScience = 0.0;
double resultQuestionRelation = 0.0;

// counter / 20
// 20 = account يعجبني بشدة up value
// res = 0.35 || 0.9
// var resultQuestionHelthy = 0 / 20;
// var resultQuestionScience = 8 / 20;
// var resultQuestionRelation = 7 / 20;

// res = 35% || 90%
// var resultQuestionPercenterHelthy = resultQuestionHelthy * 100;
// var resultQuestionPercenterScience = resultQuestionScience * 100;
// var resultQuestionPercenterRelation = resultQuestionRelation * 100;
double resultQuestionPercenterHelthy = 0.0;
double resultQuestionPercenterScience = 0.0;
double resultQuestionPercenterRelation = 0.0;

void chooseAndSelecetedAnswers() {
  if (myChooseAnswer == answers[0]) {
    selecetedAnswers = 2;
  } else if (myChooseAnswer == answers[1]) {
    selecetedAnswers = 1;
  } else if (myChooseAnswer == answers[2]) {
    selecetedAnswers = 0;
  } else if (myChooseAnswer == answers[3]) {
    selecetedAnswers = -1;
  } else if (myChooseAnswer == answers[4]) {
    selecetedAnswers = -2;
  }
}
