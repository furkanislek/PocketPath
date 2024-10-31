import 'package:pocketPath/controller/menu/bottom_navigator.dart';
import 'package:pocketPath/pages/AddCost/add_cost.dart';
import 'package:pocketPath/pages/Target/add_target.dart';
import 'package:pocketPath/pages/Target/target.dart';
import 'package:pocketPath/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Menu extends StatelessWidget {
  Menu({super.key});

  final BottomNavigationController controller =
      Get.put(BottomNavigationController());

  final List<Widget> pages = [Home(), Targets(), AddTarget()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[controller.currentIndex.value]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => AddCost()),
            (route) => false,
          );
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
    );
  }
}
