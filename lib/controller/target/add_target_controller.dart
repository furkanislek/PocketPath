import 'package:pocketPath/controller/target/target_controller.dart';
import 'package:pocketPath/services/services.dart';
import 'package:get/get.dart';
import 'package:pocketPath/controller/home/budget_controller.dart'; // Import BudgetController

class AddTargetController extends GetxController {
  final TargetController controller = Get.put(TargetController());
  var selectedTypeName = ''.obs;
  var selectedBudget = ''.obs;
  var selectedDate = Rxn<DateTime>();

  void setTypeName(String typename) {
    selectedTypeName.value = typename;
  }

  void setSelectedBudget(String budget) {
    selectedBudget.value = budget;
  }

  void setSelectedDate(DateTime date) {
    selectedDate.value = date;
  }

  Future<void> saveTarget() async {
    final authService = Auth();
    await authService.saveNewTarget(
      name: selectedTypeName.value,
      budget: double.tryParse(selectedBudget.value) ?? 0.0,
      endDate: selectedDate.value ?? DateTime.now(),
    );

    await controller.fetchTargets();
    await Get.find<BudgetController>().loadActiveTargets();
  }
}
