import 'package:cost_management/controller/home/budget_controller.dart';
import 'package:cost_management/controller/home/tab_controller.dart';
import 'package:cost_management/services/services.dart';
import 'package:get/get.dart';

class CostController extends GetxController {
  final BudgetController budgetController = Get.put(BudgetController());
  final HomeTabController homeTabController = Get.put(HomeTabController());

  var activeCoast = <Map<String, dynamic>>[].obs;

  final Auth authService = Auth();

  @override
  void onInit() {
    super.onInit();
    ever(budgetController.selectedTargetId, (_) => fetchsCosts());
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
}
