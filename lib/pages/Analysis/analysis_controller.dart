import 'package:get/get.dart';
import 'package:pocketPath/controller/target/target_controller.dart';
import 'package:pocketPath/services/services.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AnalysisController extends GetxController {
  final TargetController targetController = Get.find<TargetController>();

  var selectedTarget = ''.obs;
  var selectedTargetName = ''.obs;
  var targetAmount = 0.0.obs;
  var currentAmount = 0.0.obs;
  var targetProgress = 0.0.obs;
  var targetStartDate = DateTime.now().obs;

  var isLoading = false.obs;

  // Harcama ve birikim verileri
  var expenses = <Map<String, dynamic>>[].obs;

  void selectTarget(String id, String name, double budget, DateTime startDate) {
    selectedTarget.value = id;
    selectedTargetName.value = name;
    targetAmount.value = budget;
    targetStartDate.value = startDate;

    fetchExpenseData();
  }

  Future<void> fetchExpenseData() async {
    isLoading.value = true;

    try {
      List<Map<String, dynamic>> rawExpenses =
          await Auth().getExpensesByTargetId(targetId: selectedTarget.value);

      processExpenseData(rawExpenses);

      calculateTargetProgress(rawExpenses);
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }

  void processExpenseData(List<Map<String, dynamic>> rawExpenses) {
    expenses.clear();

    // Sadece hedefin başlangıç tarihinden sonraki harcamaları filtrele
    final filteredExpenses = rawExpenses.where((expense) {
      final expenseDate = expense['date'] is Timestamp
          ? (expense['date'] as Timestamp).toDate()
          : expense['date'] as DateTime;
      return expenseDate.isAfter(targetStartDate.value);
    }).toList();

    // Her bir harcama/birikim kaydını işle
    for (var expense in filteredExpenses) {
      final amount = expense['budget'] as double;
      final isExpense = expense['isExpense'] as bool;
      final name = expense['name'] as String;
      final date = expense['date'] is Timestamp
          ? (expense['date'] as Timestamp).toDate()
          : expense['date'] as DateTime;

      expenses.add({
        'name': name,
        'date': date,
        'formattedDate': DateFormat('dd.MM.yyyy').format(date),
        'amount': amount,
        'isExpense': isExpense,
      });
    }

    // Tarihe göre sırala (en yeniden en eskiye)
    expenses.sort(
        (a, b) => (b['date'] as DateTime).compareTo(a['date'] as DateTime));

    expenses.refresh();
  }

  void calculateTargetProgress(List<Map<String, dynamic>> rawExpenses) {
    // Hedef ilerleme durumunu hesapla
    double totalAmount = 0.0;

    for (var expense in rawExpenses) {
      final amount = expense['budget'] as double;
      final isExpense = expense['isExpense'] as bool;

      // Harcamalar negatif, birikimler pozitif
      final value = isExpense ? -amount : amount;
      totalAmount += value;
    }

    currentAmount.value = totalAmount;
    targetProgress.value = totalAmount / targetAmount.value;

    // Negatif ilerleme durumunda 0 olarak göster
    if (targetProgress.value < 0) {
      targetProgress.value = 0;
    }

    // %100'den fazla ilerleme durumunda %100 olarak göster
    if (targetProgress.value > 1) {
      targetProgress.value = 1;
    }
  }

  // Toplam harcama miktarını hesapla
  double getTotalExpenses() {
    return expenses
        .where((e) => e['isExpense'] == true)
        .fold(0.0, (sum, e) => sum + (e['amount'] as double));
  }

  // Toplam birikim miktarını hesapla
  double getTotalSavings() {
    return expenses
        .where((e) => e['isExpense'] == false)
        .fold(0.0, (sum, e) => sum + (e['amount'] as double));
  }
}
