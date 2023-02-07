import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/myData.dart';

class CustomBtnGoogle extends StatefulWidget {
  CustomBtnGoogle({
    super.key,
    required this.title,
    required this.img,
    required this.onPress,
  });

  var title;
  var img;
  Function() onPress;

  @override
  State<CustomBtnGoogle> createState() => _CustomBtnGoogleState();
}

class _CustomBtnGoogleState extends State<CustomBtnGoogle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      height: 70,
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: widget.onPress,
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 203, 203, 203),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Image.asset(widget.img),
            Container(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                widget.title,
                style: TextStyle(
                  color: Color(blackColor),
                  fontFamily: fontGoogleCairo,
                  fontSize: 20
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
