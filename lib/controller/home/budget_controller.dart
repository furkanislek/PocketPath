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
  }

  Future<void> loadActiveTargets() async {
    activeTargets.value = await authService.getActiveTargets();
    if (activeTargets.isNotEmpty) {
      final lastTarget = activeTargets.first;
      setSelectedTarget(lastTarget['id'], lastTarget['name']);
    }
  }

  void setSelectedTarget(String targetId, String targetName) {
    selectedTargetId.value = targetId;
    selectedTargetName.value = targetName;
  }
}
