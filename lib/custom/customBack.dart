import 'package:flutter_app1/myData.dart';
import 'package:flutter/material.dart';

class CustomBack extends StatefulWidget {
  CustomBack({Key? key, required this.onPress}) : super(key: key);

  Function() onPress;

  @override
  State<CustomBack> createState() => _CustomBackState();
}

class _CustomBackState extends State<CustomBack> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPress,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      child: Container(
        width: 45,
        height: 45,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          // color: Color(lightGreenColor),
        ),
        child:  Icon(
          // Icons.arrow_back,
          Icons.arrow_back_ios_rounded,
          color: Colors.white,
          // color: Color(blackColor),
          size: 25,
        ),
      ),
    );
  }
}
