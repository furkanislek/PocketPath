import 'package:cost_management/controller/menu/bottom_navigator.dart';
import 'package:cost_management/controller/target/target_controller.dart';
import 'package:cost_management/pages/Target/add_target.dart';
import 'package:cost_management/pages/Target/tab_period.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Targets extends StatelessWidget {
  Targets({super.key});
  final TargetController controller = Get.put(TargetController());
  final BottomNavigationController controllerMenu =
      Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Target"),
        backgroundColor: const Color(0xFFF2F2F2),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            controllerMenu.changeTabIndex(0);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.addchart_outlined),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => AddTarget()),
                (route) => false,
              );
            },
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF2F2F2),
      body: Column(
        children: [
          // Add the TargetPeriodSelector here
          TargetPeriodSelector(controller: controller),
          Expanded(
            child: Obx(() {
              return controller.list.isEmpty
                  ? const Center(child: Text('No targets available'))
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width / 35, vertical: height / 50),
                      child: ListView.builder(
                        itemCount: controller.list.length,
                        itemBuilder: (context, index) {
                          var target = controller.list[index];
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: width / 110,
                                vertical: height / 100),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width / 75),
                                    decoration: BoxDecoration(
                                      color: target['progress'] >= 1
                                          ? Color(0xFF2CBABB)
                                          : Color(0xFFFFFFFF),
                                      borderRadius: BorderRadius.circular(15.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: width / 19,
                                      ),
                                      child: SizedBox(
                                        height: height / 5,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  right: width / 45),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    target['target']['name'],
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          target['progress'] >
                                                                  1.0
                                                              ? Colors.white
                                                              : Colors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    DateFormat('yyyy-MM-dd')
                                                        .format(target['target']
                                                                ['endDate']
                                                            .toDate()),
                                                    style: TextStyle(
                                                      color:
                                                          target['progress'] >
                                                                  1.0
                                                              ? Colors.white
                                                              : Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: height / 10,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        target['remainingBudget']
                                                            .toString(),
                                                        style: TextStyle(
                                                            color:
                                                                target['progress'] >
                                                                        1.0
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                            fontSize: 15),
                                                      ),
                                                      Text(
                                                        target['target']
                                                                ['budget']
                                                            .toString(),
                                                        style: TextStyle(
                                                          color:
                                                              target['progress'] >
                                                                      1.0
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Balance",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: target[
                                                                        'progress'] >
                                                                    1.0
                                                                ? Colors.white
                                                                : const Color(
                                                                    0xFF55BB7D)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  children: [
                                                    CircularPercentIndicator(
                                                      radius: 50.0,
                                                      lineWidth: 8.0,
                                                      animation: true,
                                                      percent: target[
                                                                  'progress'] >
                                                              1.0
                                                          ? 1.0
                                                          : target['progress'],
                                                      center: Text(
                                                        "${(target['progress'] > 1.0 ? 100.00 : target['progress'] * 100).toStringAsFixed(2)}%",
                                                        style: TextStyle(
                                                          color:
                                                              target['progress'] >
                                                                      1.0
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 15.0,
                                                        ),
                                                      ),
                                                      circularStrokeCap:
                                                          CircularStrokeCap
                                                              .round,
                                                      progressColor: target[
                                                                  'progress'] >
                                                              1.0
                                                          ? Color.fromARGB(
                                                              255, 84, 141, 255)
                                                          : Color(0xFF55BB7D),
                                                    ),
                                                  ],
                                                ),
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
                          );
                        },
                      ),
                    );
            }),
          ),
        ],
      ),
    );
  }
}
