import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  var currentIndex = 0.obs;

  void changeTabIndex(int index) {
    currentIndex.value = index;
  }
}
