import 'package:flutter_app1/myData.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextBtnCard extends StatelessWidget {
  CustomTextBtnCard({
    required this.logoGPA,
    required this.titleGreenCardGPA,
    required this.titleBLueCardGPA,
    required this.onPressTerm,
    required this.onPressCumulative,
    required this.fontSizeTitle,
    super.key,
  });

  // ignore: prefer_typing_uninitialized_variables
  var logoGPA;
  // ignore: prefer_typing_uninitialized_variables
  var titleGreenCardGPA;
  // ignore: prefer_typing_uninitialized_variables
  var titleBLueCardGPA;
  // ignore: prefer_typing_uninitialized_variables
  double fontSizeTitle;

  VoidCallback onPressTerm;
  VoidCallback onPressCumulative;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: onPressTerm,
          child: Container(
            width: 300,
            height: 180,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(129, 255, 184, 1),
                  Color.fromRGBO(40, 179, 111, 1),
                ],
                stops: [0.3, 1],
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 25,
                  left: 25,
                  child: Image.asset("images/$logoGPA.png"),
                ),
                // ignore: prefer_const_constructors
                Positioned(
                  right: 25,
                  bottom: 10,
                  child: Text(
                    titleGreenCardGPA,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSizeTitle,
                      fontFamily: fontGoogleCairo,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          onPressed: onPressCumulative,
          child: Container(
            width: 300,
            height: 180,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(101, 253, 240, 1),
                  Color.fromRGBO(29, 111, 163, 1),
                ],
                stops: [0.3, 1],
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 25,
                  left: 25,
                  child: Image.asset("images/$logoGPA.png"),
                ),
                // ignore: prefer_const_constructors
                Positioned(
                  right: 25,
                  bottom: 10,
                  child: Text(
                    titleBLueCardGPA,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSizeTitle,
                      fontFamily: fontGoogleCairo,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
