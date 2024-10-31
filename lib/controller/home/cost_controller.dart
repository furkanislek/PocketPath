import 'package:pocketPath/controller/home/budget_controller.dart';
import 'package:pocketPath/controller/home/tab_controller.dart';
import 'package:pocketPath/controller/target/target_controller.dart';
import 'package:pocketPath/services/services.dart';
import 'package:get/get.dart';

class CostController extends GetxController {
  final BudgetController budgetController = Get.put(BudgetController());
  final HomeTabController homeTabController = Get.put(HomeTabController());
  final TargetController targetController = Get.put(TargetController());

  var activeCoast = <Map<String, dynamic>>[].obs;

  final Auth authService = Auth();

  @override
  void onInit() {
    super.onInit();
    fetchsCosts();
    ever(budgetController.selectedTargetId, (_) {
      print("Target ID değişti, fetchsCosts çağrılıyor");
      fetchsCosts();
    });
    ever(homeTabController.selectedIndex, (index) {
      if (index == 0) {
        fetchDailyCosts();
      } else if (index == 1) {
        fetchsCosts();
      } else if (index == 2) {
        fetchYearlyCosts();
      }
    });

    budgetController.activeTargets();
    fetchsCosts();
  }

  Future<void> fetchsCosts() async {
    activeCoast.value = await authService.getMonthlyExpenses(
      selectedTargetId: budgetController.selectedTargetId.value,
    );
  }

  Future<void> fetchDailyCosts() async {
    activeCoast.value = await authService.getDailyExpenses(
      selectedTargetId: budgetController.selectedTargetId.value,
    );
  }

  Future<void> fetchYearlyCosts() async {
    activeCoast.value = await authService.getYearlyExpenses(
      selectedTargetId: budgetController.selectedTargetId.value,
    );
  }

  Future<void> deleteCost(String docId) async {
    await authService.deleteCost(docId);
    await targetController.fetchTargetsById();
    fetchsCosts(); // Refresh the costs after deletion
  }
}
