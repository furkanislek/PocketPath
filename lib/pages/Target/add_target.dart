import 'package:cost_management/controller/target/add_target_controller.dart';
import 'package:cost_management/pages/Menu/menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTarget extends StatelessWidget {
  AddTarget({Key? key}) : super(key: key);

  final AddTargetController controller = Get.put(AddTargetController());

  final TextEditingController typeController = TextEditingController();
  final TextEditingController budgetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F2F2),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Menu()),
            );
          },
        ),
        title: const Text('Set New Plan'),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
          child: ElevatedButton(
            onPressed: () {
              final budgetString = controller.selectedBudget.value;
              final typeName = controller.selectedTypeName.value;
              final selectedDate = controller.selectedDate.value;

              if (typeName.isNotEmpty &&
                  selectedDate != null &&
                  budgetString.isNotEmpty) {
                final budget = double.tryParse(budgetString);
                if (budget != null) {
                  controller.saveTarget();
                } else {
                  Get.snackbar('Error', 'Invalid budget amount');
                }
              } else {
                Get.snackbar('Error', 'Please fill all fields');
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8256DF),
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 100.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            child: const Text(
              'Save',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Name',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            TextField(
              onChanged: (value) {
                controller.selectedTypeName(value);
              },
              decoration: InputDecoration(
                hintText: 'Type Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                suffixIcon: const Icon(Icons.info_outline),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Date',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Obx(() => TextField(
                  readOnly: true,
                  controller: TextEditingController(
                    text: controller.selectedDate.value != null
                        ? controller.selectedDate.value.toString().split(' ')[0]
                        : '', // Tarih seçilmediyse boş gösterir
                  ),
                  decoration: InputDecoration(
                    hintText: 'Select End Date',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2101),
                        );
                        if (pickedDate != null) {
                          controller.setSelectedDate(pickedDate);
                        }
                      },
                    ),
                  ),
                )),
            const SizedBox(height: 24),
            const Text(
              'Budget',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            TextField(
              onChanged: (value) {
                controller.selectedBudget(value);
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Savings Target Amount',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                suffixIcon: const Icon(Icons.attach_money),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
