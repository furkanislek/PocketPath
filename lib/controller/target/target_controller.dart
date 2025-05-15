import 'package:pocketPath/services/ad_service.dart';
import 'package:pocketPath/services/services.dart';
import 'package:get/get.dart';

class TargetController extends GetxController {
  var selectedTab = 1.obs;
  var selectedTargetId = ''.obs;

  var list = [].obs;
  var listById = [].obs;

  final AdService adService = AdService();

  @override
  void onInit() {
    super.onInit();
    // Build sırasındaki çakışmayı önlemek için gecikmeli çağrı yapılıyor
    Future.delayed(Duration(milliseconds: 100), () {
      fetchTargets();
    });
    adService.initialize();
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
        print("------------------------------------------------------------");
        print("Liste yenileniyor, eleman sayısı: ${list.length}");
        print(list);
        list.assignAll(List.from(list)); // Geçici liste oluştur ve tekrar ata
        list.refresh();
      } else {
        print("Hedefler boş, liste uzunluğu: ${list.length}");
      }
    } catch (e) {
      print("Hedefleri getirirken hata: $e");
    }
  }

  Future<void> fetchTargetsById() async {
    try {
      listById.clear();
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

          listById.add({
            'target': target,
            'remainingBudget': remainingBudget,
            'progress': remainingBudget / budget,
          });
        }

        listById.sort(
            (a, b) => a['target']['endDate'].compareTo(b['target']['endDate']));
        listById.refresh();
      }
    } catch (e) {}
  }
}
