import 'package:cost_management/services/services.dart';
import 'package:get/get.dart';

class TargetController extends GetxController {
  var selectedTab = 1.obs;
  var selectedTargetId = ''.obs;

  var list = [].obs;
  

  @override
  void onInit() {
    super.onInit();
    fetchTargets(); 
  }

  Future<void> fetchTargets() async {
    try {
      list.clear();
      List<Map<String, dynamic>> targets;

      
      if (selectedTab.value == 0) {
        targets = await Auth().getPassiveTargets();
      } else if (selectedTab.value == 1) {
        targets = await Auth().getActiveTargets();
      } else if (selectedTab.value == 2) {
        targets = await Auth().getAllTargets();
      } else {
        targets = [];
      }

      List<Map<String, dynamic>> expenses = await Auth().getExpenses();
      if (targets.isNotEmpty) {
        for (var target in targets) {
          String targetId = target['id'];
          double budget = target['budget'];

          double totalExpense = expenses
              .where((expense) => expense['targetId'] == targetId)
              .map((expense) =>
                  expense['isExpense'] ? -expense['budget'] : expense['budget'])
              .fold(0, (prev, amount) => prev + amount);
          double remainingBudget = totalExpense;

          list.add({
            'target': target,
            'remainingBudget': remainingBudget,
            'progress': remainingBudget / budget,
          });
        }

        list.sort(
            (a, b) => b['target']['endDate'].compareTo(a['target']['endDate']));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> fetchTargetsById() async {
    try {
      list.clear();
      List<Map<String, dynamic>> targets =
          await Auth().getTargetById(selectedTargetId.value);
      List<Map<String, dynamic>> expenses = await Auth().getExpenses();
      if (targets.isNotEmpty) {
        for (var target in targets) {
          String targetId = target['id'];
          double budget = target['budget'];

          double totalExpense = expenses
              .where((expense) => expense['targetId'] == targetId)
              .map((expense) =>
                  expense['isExpense'] ? -expense['budget'] : expense['budget'])
              .fold(0, (prev, amount) => prev + amount);
          double remainingBudget = totalExpense;

          list.add({
            'target': target,
            'remainingBudget': remainingBudget,
            'progress': remainingBudget / budget,
          });
        }

        list.sort(
            (a, b) => b['target']['endDate'].compareTo(a['target']['endDate']));
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
