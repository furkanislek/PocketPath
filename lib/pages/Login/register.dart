import 'package:cost_management/pages/Login/login.dart';
import 'package:cost_management/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();

  var errorMessage = ''.obs;

  Future<void> registerUser() async {
    try {
      await Auth().registerUser(
          email: emailController.text,
          password: passwordController.text,
          firstName: nameController.text,
          surname: surnameController.text);
      errorMessage.value = ''; // Hata mesajını sıfırla
    } on FirebaseAuthException catch (e) {
      errorMessage.value = e.message ?? 'Bir hata oluştu';
    }
  }
}

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.put(RegisterController());
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: width / 13.7, right: width / 13.7, top: height / 17.8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height / 74.17),
              Text(
                "Aramıza Hoşgeldin 🤗",
                style: TextStyle(
                    fontSize: height / 31,
                    fontFamily: "Poppins-Bold",
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: height / 40),
              _buildTextField(controller.nameController, "First Name",
                  Icons.person_outline, width, height),
              SizedBox(height: height / 40),
              _buildTextField(controller.surnameController, "Surname",
                  Icons.person_outline, width, height),
              SizedBox(height: height / 40),
              _buildTextField(controller.emailController, "email", Icons.email,
                  width, height),
              SizedBox(height: height / 30),
              _buildPasswordField(controller.passwordController, height),
              Obx(() => controller.errorMessage.isNotEmpty
                  ? Padding(
                      padding: EdgeInsets.only(top: height / 81.1),
                      child: Text(
                        controller.errorMessage.value,
                        style: const TextStyle(color: Colors.red),
                      ),
                    )
                  : const SizedBox.shrink()),
              SizedBox(height: height / 55),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height / 44, horizontal: width / 55),
                  child: ElevatedButton(
                    onPressed: () => controller.registerUser(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8256DF),
                      padding: EdgeInsets.symmetric(
                          vertical: height / 56.33, horizontal: width / 4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Text(
                      'Kayıt Ol',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: height / 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height / 81),
              GestureDetector(
                child: Text.rich(
                  TextSpan(
                    text: "Hesabın Mevcut Mu ? ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: height / 60,
                        fontFamily: "Poppins-Bold",
                        fontWeight: FontWeight.w700),
                    children: [
                      TextSpan(
                        text: "Giriş Yap 😊",
                        style: const TextStyle(
                          color: Color(0xFF8256DF),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.off(() => const Login());
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText,
      IconData icon, double width, double height) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          vertical: height / 74.16, horizontal: width / 34.25),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.only(right: width / 34.25),
            child: Icon(icon),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
              color: controller.text.isEmpty
                  ? const Color.fromARGB(220, 168, 163, 161)
                  : const Color(0xFF282625)),
        ),
      ),
    );
  }

  Widget _buildPasswordField(TextEditingController controller, double height) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: true,
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          prefixIcon: const Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(Icons.lock),
          ),
          hintText: "*********",
          hintStyle: TextStyle(
              color: controller.text.isEmpty
                  ? const Color.fromARGB(220, 168, 163, 161)
                  : const Color(0xFF282625)),
        ),
      ),
    );
  }
}
