import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/myData.dart';

class CustomSwitchesSettings extends StatefulWidget {
  CustomSwitchesSettings({
    super.key,
    required this.switches,
    required this.valueSwitches,
    required this.imgSwitches,
    required this.titleSwitches,
  });

  var switches;
  var valueSwitches;
  var imgSwitches;
  var titleSwitches;

  @override
  State<CustomSwitchesSettings> createState() => _CustomSwitchesSettingsState();
}

class _CustomSwitchesSettingsState extends State<CustomSwitchesSettings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(100, 99, 138, 127),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Switch(
            value: widget.valueSwitches,
            onChanged: widget.switches,
            activeColor: Color(lightGreenColor),
          ),
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  widget.titleSwitches,
                  style: const TextStyle(
                      fontFamily: fontGoogleCairo,
                      fontSize: 17,
                      color: Colors.white),
                ),
              ),
              CircleAvatar(
                backgroundImage: AssetImage(widget.imgSwitches),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
