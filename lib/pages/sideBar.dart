import 'package:flutter/material.dart';
import 'package:flutter_app1/authentcation/Login.dart';
import 'package:flutter_app1/myData.dart';
import 'package:flutter_app1/pages/homePage.dart';
import 'package:flutter_app1/pages/question.dart';
import 'package:flutter_app1/pages/switchGPA.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: duplicate_ignore
class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  Future logoutWithgoogle() async {
    dataGoogle = await GoogleSignIn().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(darkGreenColor),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 4),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 58, 113, 117),
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.symmetric(vertical: 20),
              child:

                  //  Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     const Text(
                  //       "تطبيق دُلني",
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontFamily: fontGoogleCairo,
                  //         // fontWeight: FontWeight.bold,
                  //         fontSize: 30,
                  //       ),
                  //       textAlign: TextAlign.center,
                  //     ),
                  //     ClipRRect(
                  //       borderRadius: BorderRadius.circular(10),
                  //       child: Image.asset(
                  //         "images/Logo Design important.png",
                  //         width: 50,
                  //         height: 50,
                  //         fit: BoxFit.cover,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (whatDoseLoginGoogleOrPhp == 0 ||
                      whatDoseLoginGoogleOrPhp == null)
                    ClipRRect(
                      child: Image.asset(
                        "images/logo profile2.png",
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    )
                  else if (whatDoseLoginGoogleOrPhp == 1)
                    if (avatarGoogle == null)
                      ClipRRect(
                        child: Image.asset(
                          "images/logo profile2.png",
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      )
                    else
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          avatarGoogle,
                          width: 70,
                          height: 70,
                          fit: BoxFit.contain,
                        ),
                      ),

                  if (whatDoseLoginGoogleOrPhp == 0 ||
                      whatDoseLoginGoogleOrPhp == null)
                    Text(
                      storage ?? "Username Here",
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: fontGoogleCairo,
                        // fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    )
                  else if (whatDoseLoginGoogleOrPhp == 1)
                    Text(
                      usernameGoogle ?? "Username Here",
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: fontGoogleCairo,
                        // fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  // Text(
                  //   usernameGoogle ?? "Username Here",
                  //   style: const TextStyle(
                  //     color: Colors.white,
                  //     fontFamily: fontGoogleCairo,
                  //     // fontWeight: FontWeight.bold,
                  //     fontSize: 17,
                  //   ),
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            for (int i = 0; i < sideBarItem.length; i++)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 4),
                padding: const EdgeInsets.only(right: 30),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 58, 113, 117),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  title: Text(
                    sideBarItem[i]["nameItem"],
                    style: const TextStyle(
                      color: Colors.white,
                      // color: Color(blackColor),
                      fontFamily: fontGoogleCairo,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  contentPadding: EdgeInsets.zero,
                  leading: sideBarItem[i]["iconItem"],
                  onTap: () {
                    Push(context, sideBarItem[i]["onPress"]);
                  },
                ),
              ),
            Visibility(
              visible: hideOrShowLogout,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 4),
                padding: const EdgeInsets.only(right: 30),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 58, 113, 117),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  title: const Text(
                    "تسجيل خروج",
                    style: TextStyle(
                      color: Colors.white,
                      // color: Color(blackColor),
                      fontFamily: fontGoogleCairo,
                      fontSize: 20,
                    ),
                  ),
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                  onTap: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    setState(() {
                      prefs.remove("storage");
                      prefs.remove("storageEmail");
                      prefs.remove("storagePass");
                      logoutWithgoogle();
                      email = null;
                      pass = null;
                      emailGoogle = null;
                      avatarGoogle = null;

                      // usernameGoogleOrPhp = "";
                      // emailGoogleOrPhp = "";
                      // passGoogleOrPhp = "";
                      // avatarGoogleOrPhp = "";
                      print("logout");
                      funchideOrShowLogout();
                      Push(context, Login());
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomSideBar extends StatelessWidget {
  CustomSideBar({
    Key? key,
    required this.sideBarNameItem,
    required this.sideBarIconItem,
    required this.onPress,
  }) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  var sideBarNameItem;
  // ignore: prefer_typing_uninitialized_variables
  var sideBarIconItem;

// create function
  VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: sideBarNameItem,
      leading: sideBarIconItem,
      onTap: onPress,
    );

    // TextButton(
    //   onPressed: onPress,
    //   child: Container(
    //     margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    //     height: 50,
    //     decoration: BoxDecoration(
    //       color: const Color.fromRGBO(205, 243, 255, 0.5),
    //       borderRadius: BorderRadius.circular(15),
    //     ),
    //     child: ListTile(

    //         Positioned(
    //           // right: 50,
    //           // top: 6,
    //           child: Text(
    //             "$sideBarNameItem",
    //             style: TextStyle(
    //               color: Colors.white,
    //               // color: Color(blackColor),

    //               fontFamily: fontGoogleCairo,
    //               fontSize: 20,
    //             ),
    //           ),
    //         ),
    //         Positioned(
    //           // top: 12,
    //           // right: 15,
    //           child: sideBarIconItem,
    //         ),

    //     ),
    //   ),
    // );
  }
}
