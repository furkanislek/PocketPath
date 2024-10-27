import 'package:cost_management/controller/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                'Hello ${controller.userName.value} ${controller.surName.value}', // Kullanıcı adı burada görüntülenir
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3D423F)))),
          ],
        ),
        Row(
          children: [
            Text(
              "Welcome Back!",
              style: TextStyle(fontSize: 14, color: Color(0xFF868B88)),
            )
          ],
        )
      ],
    );
  }
}
