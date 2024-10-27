import 'package:cost_management/controller/target/target_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Targets extends StatelessWidget {
  Targets({super.key});
  final TargetController controller = Get.put(TargetController());

  @override
  Widget build(BuildContext context) {
    print("Targetsssss : ${controller.list}");
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: width / 20, vertical: height / 50),
      child: Column(
        children: [
          Row(
            children: [Text("data")],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: width / 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3))
                      ]),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width / 19,
                    ),
                    child: SizedBox(
                      height: height / 4,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: width / 45),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Remaining Budget"),
                                Text("Nov 2024")
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: height / 11,
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "₺8,200.00",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Balance",
                                      style:
                                          TextStyle(color: Color(0xFF55BB7D)),
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  CircularPercentIndicator(
                                    radius: 50.0,
                                    lineWidth: 8.0,
                                    animation: true,
                                    percent: 0.7,
                                    center: const Text(
                                      "70%",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    circularStrokeCap: CircularStrokeCap.round,
                                    progressColor: const Color(0xFF55BB7D),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
