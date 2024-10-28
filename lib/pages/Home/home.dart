import 'package:cost_management/components/home/budget.dart';
import 'package:cost_management/components/home/cost.dart';
import 'package:cost_management/components/home/tab_period.dart';
import 'package:cost_management/components/home/title.dart';
import 'package:cost_management/controller/home/cost_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final CostController costController = Get.put(CostController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFaFaFa),
        toolbarHeight: 20,
      ),
      backgroundColor: const Color(0xFFFaFaFa),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: width / 20, vertical: height / 65),
        child: Column(
          children: [
            Row(
              children: [HomeTitle()],
            ),
            SizedBox(height: height / 40),
            Row(
              children: [Expanded(child: Budget())],
            ),
            SizedBox(height: height / 40),
            Row(
              children: [Expanded(child: TabSelection())],
            ),
            SizedBox(height: height / 40),
            Expanded(
              child: SizedBox(
                height: height * 0.5,
                child: Obx(() {
                  return ListView.builder(
                    itemCount: costController.activeCoast.length,
                    itemBuilder: (context, index) {
                      var costs = costController.activeCoast[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 3),
                        child: Costs(costs: costs),
                      ); // Pass the costs without creating a new controller
                    },
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
