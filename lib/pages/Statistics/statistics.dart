import 'package:cost_management/controller/Statistics/chart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Statistics extends StatelessWidget {
  Statistics({super.key});

  final ChartController chartController = Get.put(ChartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      backgroundColor: const Color(0xFFF2F2F2),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Budget Status",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Obx(
                  () => DropdownButton<String>(
                    value: chartController.selectedFilter.value,
                    items: ['Günlük', 'Haftalık', 'Aylık', 'Yıllık']
                        .map((String filter) {
                      return DropdownMenuItem<String>(
                        value: filter,
                        child: Text(filter),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      chartController.updateFilter(newValue!);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: Obx(
                () => SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  series: <CartesianSeries>[
                    LineSeries<ChartData, String>(
                      dataSource: chartController.incomeData.toList(),
                      xValueMapper: (ChartData data, _) => data.day,
                      yValueMapper: (ChartData data, _) => data.amount,
                      name: 'Gelir',
                      color: Colors.green,
                    ),
                    LineSeries<ChartData, String>(
                      dataSource: chartController.expenseData.toList(),
                      xValueMapper: (ChartData data, _) => data.day,
                      yValueMapper: (ChartData data, _) => data.amount,
                      name: 'Gider',
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text("Income", style: TextStyle(color: Colors.green)),
                      Text("\$19,850.00", style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Expense", style: TextStyle(color: Colors.red)),
                      Text("\$7,650.00", style: TextStyle(fontSize: 24)),
                    ],
                  ),
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Bütçe detay sayfasına git
                },
                child: Text("VIEW BUDGET"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
