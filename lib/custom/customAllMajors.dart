import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app1/custom/customBack.dart';
import 'package:flutter_app1/myData.dart';

// ignore: must_be_immutable
class GetDataMajors extends StatefulWidget {
  GetDataMajors({super.key});

  @override
  State<GetDataMajors> createState() => _GetDataMajorsState();
}

class _GetDataMajorsState extends State<GetDataMajors> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var index = 0;
            index < data[counterUnversity]["id"]["data"]["majorTitle"].length;
            index++)
          CustomContentMajor(
            majorImgItem: data[counterUnversity]["id"]["data"]["majorImg"]
                [index],
            majorTitleItem: data[counterUnversity]["id"]["data"]["majorTitle"]
                [index],
            cc: index,
          ),
      ],
    );
  }
}

// ignore: must_be_immutable
class CustomContentMajor extends StatefulWidget {
  // var majorTitleItemNameInCustom;

  // var majorTitleItemRatioInCustom;

  CustomContentMajor({
    Key? key,
    required this.majorImgItem,
    required this.majorTitleItem,
    required this.cc,
    // required this.majorTitleItemRatioInCustom,
  }) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  var majorImgItem;
  // ignore: prefer_typing_uninitialized_variables
  var majorTitleItem;
  var cc;
  @override
  State<CustomContentMajor> createState() => _CustomContentMajorState();
}

class _CustomContentMajorState extends State<CustomContentMajor> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              backgroundColor: Color(darkGreenColor),
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Pop(context);
                            },
                            icon: const Icon(
                              Icons.keyboard_arrow_up_rounded,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                          Container(),
                        ],
                      ),
                      if (counterUnversity == 3 || counterUnversity == 1)
                        for (int i = 0;
                            i <
                                data[counterUnversity]["id"]["data"]
                                            ["dataNameAndRatio"][widget.cc]
                                        ["majorTitleItemName"]
                                    .length;
                            i++)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 40, horizontal: 20),
                            margin: const EdgeInsets.only(top: 50),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(170, 236, 57, 57),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.center,
                            child: SingleChildScrollView(
                              child: Column(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Text(
                                    data[counterUnversity]["id"]["data"]
                                            ["dataNameAndRatio"][widget.cc]
                                        ["majorTitleItemName"][i],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: fontGoogleCairo,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )

                      // Center(
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Container(
                      //         width: 200,
                      //         padding: const EdgeInsets.all(10),
                      //         decoration: BoxDecoration(
                      //           color: const Color.fromARGB(
                      //               100, 99, 138, 127),
                      //           borderRadius: BorderRadius.circular(20),
                      //         ),
                      //         child: Column(
                      //           // ignore: prefer_const_literals_to_create_immutables
                      //           children: [
                      //             const Center(
                      //               child: Text("wieohfiowehfiwehfiowe"),
                      //             ),
                      //             // Text(
                      //             //   data[counterUnversity]["id"]["data"]
                      //             //               ["dataNameAndRatio"]
                      //             //           [widget.cc]
                      //             //       ["majorTitleItemRatio"][index],
                      //             //   style: const TextStyle(
                      //             //     color: Colors.white,
                      //             //     fontFamily: fontGoogleCairo,
                      //             //     fontSize: 30,
                      //             //   ),
                      //             // ),
                      //             // Text(
                      //             //   data[counterUnversity]["id"]["data"]
                      //             //               ["dataNameAndRatio"]
                      //             //           [widget.cc]
                      //             //       ["majorTitleItemName"][index],
                      //             //   softWrap: true,
                      //             //   style: const TextStyle(
                      //             //     color: Colors.white,
                      //             //     fontFamily: fontGoogleCairo,
                      //             //     fontSize: 22,
                      //             //   ),
                      //             //   textAlign: TextAlign.center,
                      //             // ),
                      //           ],
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // );

                      else
                        Expanded(
                          child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 50,
                              mainAxisExtent: 170,
                            ),
                            itemCount: data[counterUnversity]["id"]["data"]
                                        ["dataNameAndRatio"][widget.cc]
                                    ["majorTitleItemName"]
                                .length,
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 200,
                                    padding: EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(100, 99, 138, 127),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(50),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          data[counterUnversity]["id"]["data"]
                                                      ["dataNameAndRatio"]
                                                  [widget.cc]
                                              ["majorTitleItemRatio"][index],
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: fontGoogleCairo,
                                            fontSize: 30,
                                          ),
                                        ),
                                        Text(
                                          data[counterUnversity]["id"]["data"]
                                                      ["dataNameAndRatio"]
                                                  [widget.cc]
                                              ["majorTitleItemName"][index],
                                          softWrap: true,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: fontGoogleCairo,
                                            fontSize: 22,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                );
              },
            );
          },
          child: Card(
            color: Color(darkGreenColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    // ignore: prefer_const_constructors
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          widget.majorImgItem,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      widget.majorTitleItem,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
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
          ),
        ),
      ],
    );
  }
}
