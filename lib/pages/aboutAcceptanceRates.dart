import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app1/custom/customBack.dart';
import 'package:flutter_app1/myData.dart';

class Item {
  late String headTitleUnversity;
  late String bodyDetails;
  Item({required this.headTitleUnversity, required this.bodyDetails});
}

class AboutRates extends StatefulWidget {
  const AboutRates({super.key});

  @override
  State<AboutRates> createState() => _AboutRatesState();
}

final List<Item> items = [];

class _AboutRatesState extends State<AboutRates> {
  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      for (var i = 0; i < dataAboutRates.length; i++) {
        items.add(
          Item(
              headTitleUnversity: dataAboutRates[i]["id"]["unversityTitle"],
              bodyDetails: dataAboutRates[i]["id"]["aboutRates"]),
        );
      }
    }
    return Scaffold(
      backgroundColor: Color(darkBlueColor),
      appBar: AppBar(
        leading: CustomBack(
          onPress: () {
            Pop(context);
          },
        ),
        title: const Text(
          "نسب القبول",
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontFamily: fontGoogleCairo,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ExpansionPanelList.radio(
                elevation: 0,
                children: items
                    .map(
                      (e) => ExpansionPanelRadio(
                        backgroundColor: Color(darkGreenColor),
                        canTapOnHeader: true,
                        value: e,
                        headerBuilder: (context, isExpanded) {
                          return Column(
                            children: [
                              ListTile(
                                contentPadding: const EdgeInsets.all(10),
                                title: Text(
                                  e.headTitleUnversity,
                                  style: const TextStyle(
                                    fontFamily: fontGoogleCairo,
                                    fontSize: 21,
                                  ),
                                  textDirection: TextDirection.rtl,
                                ),
                                textColor: Colors.white,
                              ),
                            ],
                          );
                        },
                        body: ListTile(
                          textColor: Colors.white,
                          title: Text(
                            e.bodyDetails,
                            textDirection: TextDirection.rtl,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
