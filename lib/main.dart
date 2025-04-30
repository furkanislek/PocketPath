import 'package:pocketPath/controller/auth/auth_controller.dart';
import 'package:pocketPath/firebase_options.dart';
import 'package:pocketPath/pages/Login/login.dart';
import 'package:pocketPath/pages/Menu/menu.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketPath/services/ad_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final adService = AdService();
  await adService.initialize();
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

        return authController.user.value == null
            ? const Login() 
            : Menu(); 
      }),
    );
  }
}
