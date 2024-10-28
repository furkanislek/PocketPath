import 'package:get/get.dart';

class ChartController extends GetxController {
  var selectedFilter = 'Haftalık'.obs;

  // Günlük, haftalık, aylık ve yıllık örnek veri setleri
  final List<ChartData> dailyIncomeData = [
    ChartData('Pzt', 1000),
    ChartData('Salı', 1500),
    ChartData('Çarş', 1300),
    ChartData('Per', 1700),
    ChartData('Cum', 1600),
    ChartData('Cmt', 1400),
    ChartData('Paz', 1200),
  ];

  final List<ChartData> weeklyIncomeData = [
    ChartData('Hafta 1', 10000),
    ChartData('Hafta 2', 12000),
    ChartData('Hafta 3', 11000),
    ChartData('Hafta 4', 10500),
  ];

  final List<ChartData> monthlyIncomeData = [
    ChartData('Ocak', 45000),
    ChartData('Şubat', 47000),
    ChartData('Mart', 49000),
    ChartData('Nisan', 48000),
  ];

  final List<ChartData> yearlyIncomeData = [
    ChartData('2020', 540000),
    ChartData('2021', 560000),
    ChartData('2022', 580000),
    ChartData('2023', 570000),
  ];

  final List<ChartData> dailyExpenseData = [
    ChartData('Pzt', 500),
    ChartData('Salı', 800),
    ChartData('Çarş', 600),
    ChartData('Per', 900),
    ChartData('Cum', 700),
    ChartData('Cmt', 850),
    ChartData('Paz', 750),
  ];

  final List<ChartData> weeklyExpenseData = [
    ChartData('Hafta 1', 4000),
    ChartData('Hafta 2', 4500),
    ChartData('Hafta 3', 4200),
    ChartData('Hafta 4', 4300),
  ];

  final List<ChartData> monthlyExpenseData = [
    ChartData('Ocak', 20000),
    ChartData('Şubat', 22000),
    ChartData('Mart', 21000),
    ChartData('Nisan', 20500),
  ];

  final List<ChartData> yearlyExpenseData = [
    ChartData('2020', 240000),
    ChartData('2021', 250000),
    ChartData('2022', 255000),
    ChartData('2023', 245000),
  ];

  // Gösterilecek gelir ve gider verileri
  var incomeData = <ChartData>[].obs;
  var expenseData = <ChartData>[].obs;

  @override
  void onInit() {
    super.onInit();
    updateFilter(selectedFilter.value); // İlk filtreleme için çağır
  }

  // Filtreye göre gelir ve gider verilerini güncelle
  void updateFilter(String filter) {
    selectedFilter.value = filter;

    switch (filter) {
      case 'Günlük':
        incomeData.assignAll(dailyIncomeData);
        expenseData.assignAll(dailyExpenseData);
        break;
      case 'Haftalık':
        incomeData.assignAll(weeklyIncomeData);
        expenseData.assignAll(weeklyExpenseData);
        break;
      case 'Aylık':
        incomeData.assignAll(monthlyIncomeData);
        expenseData.assignAll(monthlyExpenseData);
        break;
      case 'Yıllık':
        incomeData.assignAll(yearlyIncomeData);
        expenseData.assignAll(yearlyExpenseData);
        break;
    }
  }
}

class ChartData {
  ChartData(this.day, this.amount);
  final String day;
  final double amount;
}
