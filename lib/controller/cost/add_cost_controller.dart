import 'package:cost_management/controller/home/cost_controller.dart';
import 'package:cost_management/controller/target/target_controller.dart';
import 'package:cost_management/services/services.dart';
import 'package:get/get.dart';

class AddCostController extends GetxController {
  var isExpenseSelected = true.obs;
  var selectedCategory = ''.obs;
  var selectedTypeName = ''.obs;
  var selectedBudget = ''.obs;

  var activeTargets = <Map<String, dynamic>>[].obs;
  var selectedTargetId = ''.obs;
  var selectedTargetName = ''.obs;

  final Auth authService = Auth();
  final TargetController controller = Get.put(TargetController());
  final CostController costController = Get.put(CostController());

  @override
  void onInit() {
    super.onInit();
    loadActiveTargets();
  }

  Future<void> loadActiveTargets() async {
    activeTargets.value = await authService.getActiveTargets();
  }

  void toggleSelection(bool isExpense) {
    isExpenseSelected.value = isExpense;
  }

  void setSelectedCategory(String category) {
    selectedCategory.value = category;
  }

  void setTypeName(String typename) {
    selectedTypeName.value = typename;
  }

  void setSelectedBudget(String budget) {
    selectedBudget.value = budget;
  }

  void setSelectedTarget(String targetId, String targetName) {
    selectedTargetId.value = targetId;
    selectedTargetName.value = targetName;
  }

  Future<void> saveExpense() async {
    // Saniye cinsine çevir

    await authService.saveExpense(
        name: selectedTypeName.value,
        category: selectedCategory.value,
        budget: double.parse(selectedBudget.value),
        isExpense: isExpenseSelected.value,
        targetId: selectedTargetId.value,
        targetName: selectedTargetName.value);

    await controller.fetchTargets();
    await costController.activeCoast();
  }
}
