import 'package:cost_management/services/services.dart';
import 'package:get/get.dart';

class BudgetController extends GetxController {
  var activeTargets = <Map<String, dynamic>>[].obs;
  var selectedTargetId = ''.obs;
  var selectedTargetName = ''.obs;

  final Auth authService = Auth();

  @override
  void onInit() {
    super.onInit();
    loadActiveTargets();
    print("Selected Target ID : ${selectedTargetId}");
  }

  Future<void> loadActiveTargets() async {
    // Load active targets
    activeTargets.value = await authService.getActiveTargets();

    // Check if there are active targets and set the last one as selected
    if (activeTargets.isNotEmpty) {
      final lastTarget = activeTargets.first;
      print("last : $lastTarget");
      setSelectedTarget(lastTarget['id'], lastTarget['name']);
    }
    print("Selected Target ID : ${selectedTargetId}");
  }

  void setSelectedTarget(String targetId, String targetName) {
    selectedTargetId.value = targetId;
    selectedTargetName.value = targetName;
  }
}
