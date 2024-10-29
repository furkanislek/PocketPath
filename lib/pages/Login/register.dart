import 'package:cost_management/pages/Login/login.dart';
import 'package:cost_management/pages/Login/register_confirm.dart';
import 'package:cost_management/services/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();

  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;
  var errorMessage = ''.obs;

  Future<void> registerUser() async {
    if (passwordController.text != confirmPasswordController.text) {
      errorMessage.value = "Passwords do not match.";
      return;
    } else if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        nameController.text.isEmpty ||
        surnameController.text.isEmpty) {
      errorMessage.value = "Fill all fields.";
    }
    try {
      await Auth().registerUser(
          email: emailController.text,
          password: passwordController.text,
          firstName: nameController.text,
          surname: surnameController.text);

      errorMessage.value = '';
      Get.off(() => RegisterConfirm());
    } on FirebaseAuthException catch (e) {
      errorMessage.value = e.message ?? 'An error occurred';
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
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
          padding: EdgeInsets.symmetric(
              horizontal: width / 13, vertical: height / 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/svg/register.svg',
                height: height / 6,
                width: double.infinity,
              ),
              Text(
                "Register to PocketPath app",
                style: TextStyle(
                    fontSize: height / 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              SizedBox(height: height / 50),
              GestureDetector(
                onTap: () => Get.to(() => const Login()),
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: height / 60,
                    ),
                    children: [
                      TextSpan(
                        text: "Sign In",
                        style: TextStyle(color: const Color(0xFF8256DF)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height / 30),
              _buildTextField(controller.nameController, "Full name",
                  Icons.person, width, height),
              SizedBox(height: height / 60),
              _buildTextField(controller.surnameController, "Surname",
                  Icons.person, width, height),
              SizedBox(height: height / 60),
              _buildTextField(controller.emailController, "Your e-mail",
                  Icons.email, width, height),
              SizedBox(height: height / 60),
              _buildPasswordField(
                  controller.passwordController,
                  "Type your password",
                  controller.isPasswordVisible,
                  controller.togglePasswordVisibility,
                  height),
              SizedBox(height: height / 60),
              _buildPasswordField(
                  controller.confirmPasswordController,
                  "Re-type your password",
                  controller.isConfirmPasswordVisible,
                  controller.toggleConfirmPasswordVisibility,
                  height),
              Obx(() => controller.errorMessage.isNotEmpty
                  ? Padding(
                      padding: EdgeInsets.only(top: height / 50),
                      child: Text(
                        controller.errorMessage.value,
                        style: const TextStyle(color: Colors.red),
                      ),
                    )
                  : const SizedBox.shrink()),
              SizedBox(height: height / 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.registerUser(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8256DF),
                    padding: EdgeInsets.symmetric(
                        vertical: height / 56, horizontal: width / 4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: height / 50,
                      fontWeight: FontWeight.bold,
                    ),
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
      padding: EdgeInsets.symmetric(vertical: height / 150, horizontal: 1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.grey),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildPasswordField(TextEditingController controller, String hintText,
      RxBool isVisible, Function toggleVisibility, double height) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: height / 150, horizontal: 1.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Obx(
        () => TextField(
          controller: controller,
          obscureText: !isVisible.value,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            prefixIcon: const Icon(Icons.lock, color: Colors.grey),
            suffixIcon: IconButton(
              icon: Icon(
                isVisible.value ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: () => toggleVisibility(),
            ),
          ),
        ),
      ),
    );
  }
}
