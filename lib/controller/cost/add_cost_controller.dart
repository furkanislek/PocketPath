import 'package:cost_management/services/auth.dart';
import 'package:get/get.dart';

class AddCostController extends GetxController {
  var isExpenseSelected = true.obs;
  var selectedCategory = ''.obs;
  var selectedTypeName = ''.obs;
  var selectedBudget = ''.obs;

  var activeTargets = <Map<String, dynamic>>[].obs; // Aktif hedefler
  var selectedTargetId = ''.obs; // Seçilen hedef ID
  var selectedTargetName = ''.obs; // Seçilen hedef ismi

  final Auth authService = Auth();

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
    await authService.saveExpense(
      name: selectedTypeName.value,
      category: selectedCategory.value,
      budget: double.parse(selectedBudget.value),
      isExpense: isExpenseSelected.value,
    );
  }
}
