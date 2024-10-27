import 'package:get/get.dart';

class HomeTabController extends GetxController {
  var selectedIndex = 1.obs;

  void selectTab(int index) {
    selectedIndex.value = index;
  }
}
