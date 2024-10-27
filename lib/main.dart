import 'package:cost_management/controller/auth/auth_controller.dart';
import 'package:cost_management/firebase_options.dart';
import 'package:cost_management/pages/Login/login.dart';
import 'package:cost_management/pages/Menu/menu.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Obx(() {
        final authController = Get.find<AuthController>();

        // Kullanıcı durumu kontrolü
        return authController.user.value == null
            ? const Login() // Kullanıcı giriş yapmamış
            : Menu(); // Kullanıcı giriş yapmış
      }),
    );
  }
}
