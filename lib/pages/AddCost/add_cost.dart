import 'package:pocketPath/controller/cost/add_cost_controller.dart';
import 'package:pocketPath/controller/menu/bottom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketPath/pages/Menu/menu.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        title: Text('addcost.title'.tr),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
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
                Get.snackbar('addcost.recorded'.tr, 'addcost.success'.tr,
                    icon: Icon(Icons.add_alert_sharp));
                controllerMenu.changeTabIndex(0);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Menu()),
                );
              } else {
                Get.snackbar('addcost.error'.tr, 'addcost.invalid_budget'.tr);
              }
            } else {
              Get.snackbar('addcost.error'.tr, 'addcost.fill_fields'.tr);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0996C7),
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 100.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          child: Text(
            'addcost.save'.tr,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'addcost.select_target'.tr,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
               SizedBox(height: 8.h),
              GestureDetector(
                onTap: () => _showTargetSelectionBottomSheet(context),
                child: Container(
                  height: 70.h,
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
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
                          ? 'addcost.select_target_hint'.tr
                          : controller.activeTargets.firstWhere((target) =>
                              target["id"] ==
                              controller.selectedTargetId.value)["name"],
                      style: TextStyle(
                          fontSize: 16.sp,
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
                  Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: Text(
                      'addcost.cost_type'.tr,
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
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
                         SizedBox(height: 10.h),
                        TextField(
                          onChanged: (value) {
                            controller.selectedTypeName(value);
                          },
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          maxLength: 15,
                          decoration: InputDecoration(
                            hintText: 'addcost.type_name_hint'.tr,
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
                  Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: Text(
                      'addcost.budget_amount'.tr,
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
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
                         SizedBox(height: 10.h),
                        TextField(
                          onChanged: (value) {
                            controller.selectedBudget(value);
                          },
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.currency_exchange_outlined),
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
              SizedBox(height: 25.h),
              Text(
                'addcost.category'.tr,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 90.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          left: 0, right: 15.w, top: 20.h, bottom: 20.h),
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
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: IconButton(
                                icon: Icon(
                                  _categories[index][0],
                                  color: Colors.blue,
                                  size: 25.sp,
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
               SizedBox(height: 25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Obx(() => OutlinedButton(
                          onPressed: () {
                            controller.toggleSelection(true);
                          },
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 16.h),
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
                          child: Text('addcost.expense'.tr,
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
                            padding: EdgeInsets.symmetric(vertical: 16.h),
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
                          child: Text('addcost.income'.tr,
                              style: TextStyle(
                                  color: controller.isExpenseSelected.value
                                      ? Colors.green
                                      : const Color.fromARGB(255, 27, 71, 28))),
                        )),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
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
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'addcost.select_a_target'.tr,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 16.h),
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
