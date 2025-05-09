import 'package:pocketPath/controller/cost/add_cost_controller.dart';
import 'package:pocketPath/controller/menu/bottom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketPath/pages/Menu/menu.dart';

class AddCost extends StatelessWidget {
  AddCost({Key? key}) : super(key: key);

  final AddCostController controller = Get.put(AddCostController());

  final TextEditingController typeController = TextEditingController();
  final TextEditingController budgetController = TextEditingController();
  final BottomNavigationController controllerMenu =
      Get.put(BottomNavigationController());
  final List<List<dynamic>> _categories = [
    [Icons.shopping_cart, 'Shopping'],
    [Icons.favorite, 'Healthy'],
    [Icons.fastfood, 'Food'],
    [Icons.school, 'School'],
    [Icons.airplanemode_active, 'Holiday'],
    [Icons.computer_outlined, 'Electronic'],
    [Icons.help_outline_sharp, 'Other'],
  ];

  @override
  Widget build(BuildContext context) {
    controller.loadActiveTargets();
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F2F2),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text('Add Cost'),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
        child: ElevatedButton(
          onPressed: () {
            final name = controller.selectedTypeName.value;
            final category = controller.selectedCategory.value;
            final budgetString = controller.selectedBudget.value;

            if (name.isNotEmpty &&
                category.isNotEmpty &&
                budgetString.isNotEmpty) {
              final budget = double.tryParse(budgetString);
              if (budget != null) {
                controller.saveExpense();
                Get.snackbar('Recorded', 'Cost successfully recorded !',
                    icon: Icon(Icons.add_alert_sharp));
                controllerMenu.changeTabIndex(0);
                 Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Menu()),
                );
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
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Target',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () => _showTargetSelectionBottomSheet(context),
                child: Container(
                  height: 70,
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Obx(() {
                    return Text(
                      controller.selectedTargetId.value.isEmpty
                          ? "Select an active target like \"Stock Wallet\""
                          : controller.activeTargets.firstWhere((target) =>
                              target["id"] ==
                              controller.selectedTargetId.value)["name"],
                      style: TextStyle(
                          fontSize: 16,
                          color: controller.selectedTargetId.value.isEmpty
                              ? const Color.fromARGB(220, 168, 163, 161)
                              : const Color(0xFF282625)),
                    );
                  }),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Cost Type",
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
                            hintText: "Type Name Like \"NASDAQ ETF\"",
                            hintStyle: TextStyle(
                                color: controller.selectedTypeName.value.isEmpty
                                    ? const Color.fromARGB(220, 219, 219, 219)
                                    : const Color(0xFF282625)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
              SizedBox(height: 25),
              const Text(
                'Category',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 90,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 0, right: 15.0, top: 20, bottom: 20),
                      child: Obx(() => Container(
                            decoration: BoxDecoration(
                              color: (controller.selectedCategory.value ==
                                      _categories[index][1])
                                  ? const Color.fromARGB(
                                      255, 219, 219, 219) // Selected color
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(3, 3),
                                )
                              ],
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: IconButton(
                                icon: Icon(
                                  _categories[index][0],
                                  color: Colors.blue,
                                  size: 25,
                                ),
                                onPressed: () {
                                  controller.setSelectedCategory(
                                      _categories[index][1]);
                                },
                              ),
                            ),
                          )),
                    );
                  },
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Obx(() => OutlinedButton(
                          onPressed: () {
                            controller.toggleSelection(true);
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: !controller.isExpenseSelected.value
                                ? Colors.transparent
                                : Colors.red[100],
                            side: BorderSide(
                              color: controller.isExpenseSelected.value
                                  ? Colors.red
                                  : Colors.red[100]!,
                              width: 2,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text('Expense',
                              style: TextStyle(
                                  color: !controller.isExpenseSelected.value
                                      ? Colors.red
                                      : Color.fromARGB(255, 226, 21, 7))),
                        )),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Obx(() => OutlinedButton(
                          onPressed: () {
                            controller.toggleSelection(false);
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: controller.isExpenseSelected.value
                                ? Colors.transparent
                                : Colors.green[100],
                            side: BorderSide(
                              color: controller.isExpenseSelected.value
                                  ? Colors.green[100]!
                                  : Colors.green,
                              width: 2,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text('Income',
                              style: TextStyle(
                                  color: controller.isExpenseSelected.value
                                      ? Colors.green
                                      : const Color.fromARGB(255, 27, 71, 28))),
                        )),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  void _showTargetSelectionBottomSheet(BuildContext context) {
    controller.loadActiveTargets();
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Select a Target',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              Obx(() {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.activeTargets.length,
                  itemBuilder: (context, index) {
                    final target = controller.activeTargets[index];
                    return ListTile(
                      title: Text(target['name']),
                      onTap: () {
                        controller.setSelectedTarget(
                            target['id'], target['name']);
                        Navigator.pop(context);
                      },
                    );
                  },
                );
              }),
            ],
          ),
        );
      },
    );
  }
}
