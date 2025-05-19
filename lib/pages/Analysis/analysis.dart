import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketPath/controller/menu/bottom_navigator.dart';
import 'package:pocketPath/controller/target/target_controller.dart';
import 'package:pocketPath/pages/Analysis/analysis_controller.dart';
import 'package:pocketPath/services/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Analysis extends StatelessWidget {
  Analysis({Key? key}) : super(key: key);

  final TargetController targetController = Get.find<TargetController>();
  final AnalysisController analysisController = Get.put(AnalysisController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("analysis.title".tr),
        backgroundColor: const Color(0xFFFaFaFa),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.find<BottomNavigationController>().changeTabIndex(0);
          },
        ),
      ),
      backgroundColor: const Color(0xFFFaFaFa),
      body: Column(
        children: [
          TargetSelectionButton(),

          SelectedTargetInfo(),

          Expanded(
            child: Obx(() {
              if (analysisController.selectedTarget.value.isEmpty) {
                return Center(
                  child: Text(
                    "analysis.please_select_target".tr,
                    textAlign: TextAlign.center,
                  ),
                );
              }

              if (analysisController.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                child: ExpenseSavingsBarChart(),
              );
            }),
          ),

          // Hedef ilerleme grafiği
          TargetProgressChart(),
        ],
      ),
    );
  }
}

class TargetSelectionButton extends StatelessWidget {
  const TargetSelectionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AnalysisController controller = Get.find<AnalysisController>();

    return Padding(
      padding: EdgeInsets.all(16.w),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: () async {
            await Auth().getAllTargets();
            _showTargetSelectionModal(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Obx(() => Text(
                controller.selectedTarget.value.isEmpty
                    ? "analysis.select_target".tr
                    : controller.selectedTargetName.value,
                style: TextStyle(fontSize: 16.0.sp),
              )),
        ),
      ),
    );
  }

  void _showTargetSelectionModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (context) => TargetSelectionModal(),
    );
  }
}

class TargetSelectionModal extends StatelessWidget {
  const TargetSelectionModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TargetController targetController = Get.find<TargetController>();
    final AnalysisController analysisController =
        Get.find<AnalysisController>();

    return Container(
      padding: EdgeInsets.all(16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "analysis.select_target".tr,
            style: TextStyle(
              fontSize: 18.0.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: Obx(() {
              // Tüm hedefleri al (aktif ve pasif)
              if (targetController.list.isEmpty) {
                return Center(child: Text("home.budget.noTarget".tr));
              }

              return ListView.builder(
                itemCount: targetController.list.length,
                itemBuilder: (context, index) {
                  final target = targetController.list[index]['target'];
                  return ListTile(
                    title: Text(target['name']),
                    subtitle: Text("${target['budget']} \$"),
                    onTap: () {
                      final date = target['date'] is Timestamp
                          ? (target['date'] as Timestamp).toDate()
                          : (target['date'] ?? DateTime.now());

                      analysisController.selectTarget(
                        target['id'],
                        target['name'],
                        target['budget'],
                        date,
                      );
                      Navigator.pop(context);
                    },
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}

class SelectedTargetInfo extends StatelessWidget {
  const SelectedTargetInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AnalysisController controller = Get.find<AnalysisController>();

    return Obx(
      () => controller.selectedTarget.value.isEmpty
          ? SizedBox.shrink()
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
            ),
    );
  }
}

class ExpenseSavingsBarChart extends StatelessWidget {
  const ExpenseSavingsBarChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AnalysisController controller = Get.find<AnalysisController>();

    return Obx(() {
      // Toplam harcama ve birikim miktarlarını al
      final totalExpenses = controller.getTotalExpenses();
      final totalSavings = controller.getTotalSavings();

      final maxValue =
          totalExpenses > totalSavings ? totalExpenses : totalSavings;

      return Column(
        children: [
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    width: 16.w,
                    height: 16.h,
                    color: Colors.red,
                  ),
                  SizedBox(width: 4.w),
                  Text("analysis.expenditures".tr),
                ],
              ),
              SizedBox(width: 50.w),
              Row(
                children: [
                  Container(
                    width: 16.w,
                    height: 16.h,
                    color: Colors.green,
                  ),
                  SizedBox(width: 4.w),
                  Text("analysis.savings".tr),
                ],
              ),
            ],
          ),

          SizedBox(height: 24.h),

          // Bar Chart
          Expanded(
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.center,
                maxY: maxValue * 1.1, // %20 marj ekle
                barGroups: [
                  BarChartGroupData(
                    x: 0,
                    barRods: [
                      BarChartRodData(
                        toY: totalExpenses,
                        color: Colors.red,
                        width: 40.w,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 1,
                    barRods: [
                      BarChartRodData(
                        toY: totalSavings,
                        color: Colors.green,
                        width: 40.w,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ],
                  ),
                ],
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        String text = '';
                        switch (value.toInt()) {
                          case 0:
                            break;
                          case 1:
                            break;
                        }
                        return Padding(
                          padding: EdgeInsets.only(right: 16.w, left: 24.w),
                          child: Text(
                            text,
                            style: TextStyle(
                              color: Color.fromARGB(255, 139, 46, 46),
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          '${value.toInt()} \$',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                          ),
                        );
                      },
                      reservedSize: 40.w,
                    ),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(show: false),
                gridData: FlGridData(show: true),
              ),
            ),
          ),

          // Toplam değerler
          SizedBox(height: 24.h),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      "analysis.total_expenditures".tr,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${totalExpenses.toStringAsFixed(2)} \$",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "analysis.total_savings".tr,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${totalSavings.toStringAsFixed(2)} \$",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Harcama ve birikim listesi
          if (controller.expenses.isNotEmpty)
            Container(
              height: 200.h,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: ListView.builder(
                itemCount: controller.expenses.length,
                itemBuilder: (context, index) {
                  final expense = controller.expenses[index];
                  final isExpense = expense['isExpense'] as bool;
                  final amount = expense['amount'] as double;
                  final name = expense['name'] as String;
                  final formattedDate = expense['formattedDate'] as String;

                  return ListTile(
                    leading: Icon(
                      isExpense ? Icons.arrow_downward : Icons.arrow_upward,
                      color: isExpense ? Colors.red : Colors.green,
                    ),
                    title: Text(name),
                    subtitle: Text(formattedDate),
                    trailing: Text(
                      "${amount.toStringAsFixed(2)} \$",
                      style: TextStyle(
                        color: isExpense ? Colors.red : Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      );
    });
  }
}

class TargetProgressChart extends StatelessWidget {
  const TargetProgressChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AnalysisController controller = Get.find<AnalysisController>();

    return Obx(
      () => controller.selectedTarget.value.isEmpty
          ? SizedBox.shrink()
          : Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "analysis.target_progress".tr,
                    style: TextStyle(
                      fontSize: 16.0.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  LinearProgressIndicator(
                    value: controller.targetProgress.value,
                    backgroundColor: Colors.grey.shade300,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      controller.targetProgress.value >= 1.0
                          ? Colors.green
                          : const Color(0xFF2CBABB),
                    ),
                    minHeight: 20.h,
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${("analysis.available").tr}: ${controller.currentAmount.value.toStringAsFixed(2)} \$",
                        style: TextStyle(fontSize: 14.0.sp),
                      ),
                      Text(
                        "${("analysis.target").tr}: ${controller.targetAmount.value.toStringAsFixed(2)} \$",
                        style: TextStyle(fontSize: 14.0.sp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
