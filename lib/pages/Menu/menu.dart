import 'package:pocketPath/controller/menu/bottom_navigator.dart';
import 'package:pocketPath/pages/AddCost/add_cost.dart';
import 'package:pocketPath/pages/Analysis/analysis.dart';
import 'package:pocketPath/pages/Profile/profile.dart';
import 'package:pocketPath/pages/Target/add_target.dart';
import 'package:pocketPath/pages/Target/target.dart';
import 'package:pocketPath/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart'; 

class Menu extends StatelessWidget {
  Menu({super.key});

  final BottomNavigationController controller =
      Get.put(BottomNavigationController());

  final List<Widget> pages = [
    Home(),
    Analysis(),
    Targets(),
    AddTarget(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.currentIndex.value != 0) {
          controller.changeTabIndex(0);
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        body: Obx(() => pages[controller.currentIndex.value]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => AddCost());
          },
          backgroundColor: const Color(0xFF2CBABB),
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            unselectedItemColor: Colors.black54,
            selectedItemColor: Colors.black,
            onTap: controller.changeTabIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'menu.home'.tr,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.analytics_outlined),
                label: 'menu.analysis'.tr,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.pattern_outlined),
                label: 'menu.targets'.tr,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline),
                label: 'menu.add_target'.tr,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'menu.profile'.tr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
