import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app1/myData.dart';
import 'package:flutter_app1/pages/addMaterialCumulative.dart';
import 'package:flutter_app1/pages/addMaterialTerm.dart';
import 'package:flutter_app1/custom/customBack.dart';
import 'package:flutter_app1/custom/customTextBtnCard.dart';

class SwitchGPA extends StatelessWidget {
  const SwitchGPA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBack(
          onPress: () {
            Pop(context);
          },
        ),
        title: const Text(
          "حساب المعدل الجامعي",
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontFamily: fontGoogleCairo,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Color(darkBlueColor),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextBtnCard(
              logoGPA: objGPA.logo,
              fontSizeTitle: 30,
              titleGreenCardGPA: objGPA.term,
              titleBLueCardGPA: objGPA.cumulative,
              onPressTerm: () {
                whatChooseTermOrCumulative = objGPA.term;
                Push(context, const AddMaterialTerm());
              },
              onPressCumulative: () {
                whatChooseTermOrCumulative = objGPA.cumulative;
                Push(context, const AddMaterialCumulative());
              },
            )
          ],
        ),
      ),
    );
  }
}
