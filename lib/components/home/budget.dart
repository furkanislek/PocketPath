import 'package:cost_management/controller/formatter.dart';
import 'package:cost_management/controller/home/budget_controller.dart';
import 'package:cost_management/controller/target/target_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Budget extends StatelessWidget {
  Budget({super.key});

  final TargetController controller = Get.put(TargetController());
  final BudgetController maincontroller = Get.put(BudgetController());

  Future<void> fetchData() async {
    controller.selectedTargetId.value = maincontroller.selectedTargetId.value;
    await controller.fetchTargetsById();
  }

  final formatter = NumberFormat("#,###.00");

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        }

        double height = MediaQuery.sizeOf(context).height;
        double width = MediaQuery.sizeOf(context).width;

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
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
              vertical: height / 110,
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
                    child: Obx(() {
                      var selectedTarget =
                          maincontroller.activeTargets.firstWhere(
                        (target) =>
                            target['id'] ==
                            maincontroller.selectedTargetId.value,
                        orElse: () => {},
                      );
                      if (selectedTarget.isNotEmpty) {
                        var endDate = selectedTarget['endDate']
                            .toDate(); // Convert Timestamp to DateTime
                        var formattedDate =
                            DateFormat('MMM yyyy').format(endDate);

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(selectedTarget['name']),
                            Text(formattedDate),
                          ],
                        );
                      } else {
                        return const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(""),
                            Text(""),
                          ],
                        );
                      }
                    }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: height / 11,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(() {
                              if (controller.list.isNotEmpty) {
                                var target = controller.list.first;
                                return Text(
                                  '\$${formatter.format(target['remainingBudget'])}',
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                );
                              } else {
                                return const Text(
                                  "₺0.00",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                );
                              }
                            }),
                            const Text(
                              "Balance",
                              style: TextStyle(color: Color(0xFF55BB7D)),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Obx(() {
                            double progress = controller.list.isNotEmpty
                                ? controller.list.first['progress']
                                : 0;
                            return CircularPercentIndicator(
                              radius: 50.0,
                              lineWidth: 8.0,
                              animation: true,
                              percent: progress.clamp(0.0,
                                  1.0), // Limit the progress to valid range
                              center: Text(
                                "${(progress > 1 ? 100.00 : progress * 100).toStringAsFixed(0)}%",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: const Color(0xFF55BB7D),
                            );
                          }),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: width / 1.2,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: const BorderSide(color: Color(0xFF55BB7D)),
                              foregroundColor: const Color(0xFF55BB7D),
                            ),
                            onPressed: () => showBottomModal(context),
                            child: const Text("Select Target Plan"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void showBottomModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      backgroundColor: Colors.grey[300],
      elevation: 0,
      builder: (context) {
        return Container(
          width: double.infinity,
          height: 200,
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Obx(() {
                  // Display active targets from maincontroller
                  return ListView.builder(
                    itemCount: maincontroller.activeTargets.length,
                    itemBuilder: (context, index) {
                      var target = maincontroller.activeTargets[index];
                      return ListTile(
                        subtitle: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(target['name']),
                                  Text(
                                      'Budget: ₺${Formatter().numberFormatter.format(target['budget'])}')
                                ]),
                          ),
                        ),
                        onTap: () {
                          maincontroller.setSelectedTarget(
                              target['id'], target['name']);
                          controller.selectedTargetId.value = target['id'];
                          controller.fetchTargetsById();
                          Navigator.pop(context);
                        },
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }
}
