import 'package:cost_management/controller/home/tab_controller.dart';
import 'package:cost_management/controller/home/cost_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabSelection extends StatelessWidget {
  final HomeTabController tabController = Get.put(HomeTabController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return Obx(() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
            horizontal: width / 25.69, vertical: height / 110),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildTab("Day", 0),
            _buildTab("Month", 1),
            _buildTab("Yearly", 2),
          ],
        ),
      );
    });
  }

  Widget _buildTab(String label, int index) {
    return GestureDetector(
      onTap: () {
        tabController.selectTab(index);

        // Tab değiştiğinde doğrudan CostController'da ilgili fetch metodunu çağırma
        CostController costController = Get.find<CostController>();
        if (index == 0) {
          costController.fetchDailyCosts();
        } else if (index == 1) {
          costController.fetchsCosts();
        } else if (index == 2) {
          costController.fetchYearlyCosts();
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        curve: Curves.fastOutSlowIn,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: tabController.selectedIndex.value == index
              ? Colors.white
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: tabController.selectedIndex.value == index
                ? Color(0xFF2CBABB)
                : Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
