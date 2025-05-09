import 'package:pocketPath/controller/menu/bottom_navigator.dart';
import 'package:pocketPath/pages/AddCost/add_cost.dart';
import 'package:pocketPath/pages/Analysis/analysis.dart';
import 'package:pocketPath/pages/Target/add_target.dart';
import 'package:pocketPath/pages/Target/target.dart';
import 'package:pocketPath/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart'; // Import for SystemNavigator

class Menu extends StatelessWidget {
  Menu({super.key});

  final BottomNavigationController controller =
      Get.put(BottomNavigationController());

  final List<Widget> pages = [Home(), Analysis(), Targets(), AddTarget()];

  @override
  Widget build(BuildContext context) {
    // WillPopScope handles the system back button
    return WillPopScope(
      onWillPop: () async {
        // Check if the current tab is the first tab (Home)
        if (controller.currentIndex.value != 0) {
          // If not on the Home tab, switch to the Home tab
          controller.changeTabIndex(0);
          // Prevent the app from closing
          return false;
        } else {
          // If on the Home tab, allow the app to close
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
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.analytics_outlined),
                label: 'Analiz',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.pattern_outlined),
                label: 'Targets',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline),
                label: 'Add Target',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
