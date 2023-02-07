import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/myData.dart';

// ignore: must_be_immutable
class CustomAllUnversity extends StatefulWidget {
  CustomAllUnversity({
    super.key,
    required this.imgItem,
    required this.unversityNameItem,
    required this.onPress,
  });

  var imgItem;
  var unversityNameItem;
  Function() onPress;

  @override
  State<CustomAllUnversity> createState() => _CustomAllUnversityState();
}

class _CustomAllUnversityState extends State<CustomAllUnversity> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPress,
      child: Container(
        // width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color(darkGreenColor),
          // color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: Offset(1, 1),
              blurRadius: 5,
              spreadRadius: 1,
              color: Color(blackColor).withOpacity(0.1),
            ),
            BoxShadow(
              offset: Offset(-1, -1),
              blurRadius: 5,
              spreadRadius: 1,
              color: Color(blackColor).withOpacity(0.1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 105,
              height: 110,
              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                image: DecorationImage(
                  image: AssetImage(
                    widget.imgItem,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Text(
                widget.unversityNameItem,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  // color: Color(blackColor),
                  fontSize: 20,
                  fontFamily: fontGoogleCairo,
                ),
              ),
            ),
            const SizedBox(
              width: 0,
            ),
          ],
        ),
      ),
    );
  }
}
