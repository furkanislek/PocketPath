import 'package:pocketPath/controller/menu/bottom_navigator.dart';
import 'package:pocketPath/controller/target/add_target_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketPath/pages/Menu/menu.dart';

class AddTarget extends StatelessWidget {
  AddTarget({Key? key}) : super(key: key);

  final AddTargetController controller = Get.put(AddTargetController());
  final BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());

  final TextEditingController typeController = TextEditingController();
  final TextEditingController budgetController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F2F2),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.off(() => Menu());
            bottomNavigationController.currentIndex(1);
          },
        ),
        title: const Text('Set New Target'),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFF2F2F2),
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
                  Get.snackbar('Recorded', 'Target successfully recorded !',
                      icon: const Icon(Icons.add_alert_sharp));
                  Future.delayed(const Duration(seconds: 1), () {
                    Get.off(() => Menu());
                    bottomNavigationController
                        .currentIndex(0); // Ana ekrana yönlendir (0 = Home)
                  });
                } else {
                  Get.snackbar('Error', 'Invalid budget amount');
                }
              } else {
                Get.snackbar('Error', 'Please fill all fields');
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0996C7),
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Target Type",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 5.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        TextField(
                          onChanged: (value) {
                            controller.selectedTypeName(value);
                          },
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          maxLength: 15,
                          decoration: InputDecoration(
                            hintText: "Type Name",
                            suffixIcon: Icon(Icons.info_outline),
                            hintStyle: TextStyle(
                                color: controller.selectedTypeName.value.isEmpty
                                    ? const Color.fromARGB(220, 168, 163, 161)
                                    : const Color(0xFF282625)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Date Picker",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () => Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          TextField(
                            readOnly: true,
                            controller: TextEditingController(
                              text: controller.selectedDate.value != null
                                  ? controller.selectedDate.value
                                      .toString()
                                      .split(' ')[0]
                                  : '', // Tarih seçilmediyse boş gösterir
                            ),
                            onChanged: (value) {
                              controller.selectedBudget(value);
                            },
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
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
                              hintText: "Select Date",
                              hintStyle: TextStyle(
                                  color: controller
                                          .selectedTypeName.value.isEmpty
                                      ? const Color.fromARGB(220, 168, 163, 161)
                                      : const Color(0xFF282625)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Budget Amount",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        TextField(
                          onChanged: (value) {
                            controller.selectedBudget(value);
                          },
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.attach_money),
                            hintText: "0",
                            hintStyle: TextStyle(
                                color: controller.selectedTypeName.value.isEmpty
                                    ? const Color.fromARGB(220, 168, 163, 161)
                                    : const Color(0xFF282625)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
