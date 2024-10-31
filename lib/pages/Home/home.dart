import 'package:pocketPath/components/home/budget.dart';
import 'package:pocketPath/components/home/cost.dart';
import 'package:pocketPath/components/home/tab_period.dart';
import 'package:pocketPath/components/home/title.dart';
import 'package:pocketPath/controller/home/cost_controller.dart';
import 'package:pocketPath/pages/Login/login.dart';
import 'package:pocketPath/services/services.dart';
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
        toolbarHeight: 30,
      ),
      backgroundColor: const Color(0xFFFaFaFa),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: width / 20, vertical: height / 65),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeTitle(),
                IconButton(
                    onPressed: () {
                      Auth().signOut();
                      Get.off(() => Login());
                    },
                    icon: Icon(Icons.logout_outlined))
              ],
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
                      );
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
