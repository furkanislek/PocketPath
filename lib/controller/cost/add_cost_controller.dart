import 'package:pocketPath/controller/home/cost_controller.dart';
import 'package:pocketPath/controller/target/target_controller.dart';
import 'package:pocketPath/services/ad_service.dart';
import 'package:pocketPath/services/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddCostController extends GetxController {
  var isExpenseSelected = true.obs;
  var selectedCategory = ''.obs;
  var selectedTypeName = ''.obs;
  var selectedBudget = ''.obs;
  var moneyType = '\$'.obs;

  var activeTargets = <Map<String, dynamic>>[].obs;
  var selectedTargetId = ''.obs;
  var selectedTargetName = ''.obs;

  final Auth authService = Auth();
  final TargetController controller = Get.put(TargetController());
  final CostController costController = Get.put(CostController());
  final AdService adService = AdService();

  @override
  void onInit() {
    super.onInit();
    loadActiveTargets();
    loadMoneyType();
    adService.initialize();
  }

  Future<void> loadMoneyType() async {
    final prefs = await SharedPreferences.getInstance();
    final savedMoneyType = prefs.getString('moneyType');
    if (savedMoneyType != null && savedMoneyType.isNotEmpty) {
      moneyType.value = savedMoneyType;
    }
  }

  Future<void> loadActiveTargets() async {
    activeTargets.value = await authService.getActiveTargets();
    activeTargets.refresh();
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
        targetId: selectedTargetId.value,
        targetName: selectedTargetName.value);

    await controller.fetchTargets();
    await costController.fetchsCosts();
    costController.activeCoast.refresh();
    adService.onCostAdded();
  }

  void setMoneyType(String moneyType) async {
    this.moneyType.value = moneyType;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('moneyType', moneyType);
  }
}
