import 'package:pocketPath/controller/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTitle extends StatelessWidget {
  HomeTitle({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Obx(() => Text(
                '${'home.title.hello'.tr} ${controller.userName.value} ${controller.surName.value}',
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3D423F)))),
          ],
        ),
        Row(
          children: [
            Text(
              "home.title.welcomeBack".tr,
              style: TextStyle(fontSize: 14.sp, color: Color(0xFF868B88)),
            )
          ],
        )
      ],
    );
  }
}
