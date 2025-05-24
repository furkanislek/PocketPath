import 'package:pocketPath/controller/menu/bottom_navigator.dart';
import 'package:pocketPath/controller/target/add_target_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketPath/pages/Menu/menu.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        title: Text('target.set_new_target'.tr),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFF2F2F2),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
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
                  Get.snackbar('target.recorded'.tr, 'target.success'.tr,
                      icon: const Icon(Icons.add_alert_sharp));
                  Future.delayed(const Duration(seconds: 1), () {
                    Get.off(() => Menu());
                    bottomNavigationController
                        .currentIndex(0); // Ana ekrana yönlendir (0 = Home)
                  });
                } else {
                  Get.snackbar('target.error'.tr, 'target.invalid_budget'.tr);
                }
              } else {
                Get.snackbar('target.error'.tr, 'target.fill_fields'.tr);
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
              'target.save'.tr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: Text(
                      "target.target_type".tr,
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
                            hintText: "target.type_name".tr,
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
              SizedBox(height: 12.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: Text(
                      "target.date_picker".tr,
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Obx(
                    () => Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(15.r),
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
                                    locale: Localizations.localeOf(context),
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
                              hintText: "target.select_date".tr,
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
              SizedBox(height: 12.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: Text(
                      "target.budget_amount".tr,
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
                      borderRadius: BorderRadius.circular(15.r),
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
