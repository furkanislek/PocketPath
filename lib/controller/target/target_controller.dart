import 'package:cost_management/services/auth.dart';
import 'package:get/get.dart';

class TargetController extends GetxController {
  var list = [].obs;
  @override
  void onInit() {
    super.onInit();
    fetchTargets();
  }

  Future<void> fetchTargets() async {
    try {
      List<Map<String, dynamic>> targets = await Auth().getActiveTargets();

      if (targets.isNotEmpty) {
        list.add(targets);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
