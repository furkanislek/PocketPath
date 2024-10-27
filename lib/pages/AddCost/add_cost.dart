import 'package:cost_management/controller/cost/add_cost_controller.dart';
import 'package:cost_management/pages/Menu/menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCost extends StatelessWidget {
  AddCost({Key? key}) : super(key: key);

  final AddCostController controller = Get.put(AddCostController());

  final TextEditingController typeController = TextEditingController();
  final TextEditingController budgetController = TextEditingController();

  final List<List<dynamic>> _categories = [
    [Icons.shopping_cart, 'Shopping'],
    [Icons.favorite, 'Healthy'],
    [Icons.fastfood, 'Food'],
    [Icons.school, 'School'],
    [Icons.airplanemode_active, 'Holiday'],
    [Icons.help_outline_sharp, 'Other'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
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
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
          child: ElevatedButton(
            onPressed: () {
              final name = controller.selectedTypeName.value;
              final category =
                  controller.selectedCategory.value; // Use the reactive value
              final budgetString = controller.selectedBudget.value;

              if (name.isNotEmpty &&
                  category.isNotEmpty &&
                  budgetString.isNotEmpty) {
                final budget = double.tryParse(budgetString);
                if (budget != null) {
                  controller.saveExpense();
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Obx(() => DropdownButton<String>(
                      isExpanded: true,
                      hint: const Text("Select an active target"),
                      value: controller.selectedTargetId.value.isEmpty
                          ? null
                          : controller.selectedTargetId.value,
                      items: controller.activeTargets.map((target) {
                        return DropdownMenuItem<String>(
                          alignment: Alignment.center,
                          value: target["id"],
                          child: Text(target["name"]),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        final selectedTarget = controller.activeTargets
                            .firstWhere((target) => target["id"] == newValue);
                        controller.setSelectedTarget(
                          selectedTarget["id"],
                          selectedTarget["name"],
                        );
                      },
                    )),
              ),
              const SizedBox(height: 24),
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
                ),
              ),
              const SizedBox(height: 24),
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
                  hintText: 'Type Amount',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  suffixIcon: const Icon(Icons.attach_money),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Obx(() => ElevatedButton(
                          onPressed: () {
                            controller.toggleSelection(true);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: controller.isExpenseSelected.value
                                ? Colors.red
                                : Colors.red[100],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('Expense'),
                        )),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Obx(() => ElevatedButton(
                          onPressed: () {
                            controller.toggleSelection(false);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: controller.isExpenseSelected.value
                                ? Colors.green[100]
                                : Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('Income'),
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
}
