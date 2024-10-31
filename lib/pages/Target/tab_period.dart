import 'package:pocketPath/controller/target/target_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TargetPeriodSelector extends StatelessWidget {
  final TargetController controller;

  TargetPeriodSelector({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width / 25),
      child: Obx(() {
        return Container(
          width: width / 1.05,
          padding: EdgeInsets.symmetric(vertical: height / 110),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(20),
          ),
          child: SizedBox(
            width: width * 0.85,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTab("Passive", 0, width / 12),
                _buildTab("Active", 1, width / 12),
                _buildTab("All", 2, width / 12),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildTab(String label, int index, double width) {
    return GestureDetector(
      onTap: () {
        controller.selectedTab.value = index;
        controller.fetchTargets();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        curve: Curves.fastOutSlowIn,
        padding: EdgeInsets.symmetric(horizontal: width, vertical: 10),
        decoration: BoxDecoration(
          color: controller.selectedTab.value == index
              ? Colors.white
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: controller.selectedTab.value == index
                ? Colors.blue
                : Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
