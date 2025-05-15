import 'package:pocketPath/Introduction/introduction_screens.dart';
import 'package:pocketPath/pages/Login/register.dart';
import 'package:pocketPath/pages/Login/resetPassword.dart';
import 'package:pocketPath/services/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordVisible = false;
  String? errorMessage;

  Future<void> signIn() async {
    try {
      await Auth().signIn(
          email: emailController.text, password: passwordController.text);

      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        Get.offAll(() =>
            const IntroductionScreens()); // Use offAll to clear login stack
      }
    } on FirebaseAuthException catch (e) {
      String? errorText;
      switch (e.code) {
        case 'invalid-email':
          errorText = "login.error.invalidEmail".tr;
          break;
        case 'user-disabled':
          errorText = "login.error.userDisabled".tr;
          break;
        case 'user-not-found':
        case 'invalid-credential':
        case 'wrong-password':
          errorText = "login.error.wrongCredentials".tr;
          break;
        case 'email-already-in-use':
          errorText = "login.error.emailInUse".tr;
          break;
        case 'operation-not-allowed':
          errorText = "login.error.notAllowed".tr;
          break;
        case 'email-not-verified':
          errorText = "login.error.verifyEmail".tr;
          break;
        default:
          errorText = "login.error.generic".tr;
      }
      setState(() {
        errorMessage = errorText;
      });
    }
  }

  Future<void> resetPassword() async {
    String email = emailController.text;
    if (email.isEmpty) {
      setState(() {
        errorMessage = "login.pleaseEnterEmail".tr;
      });
      return;
    }
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("login.resetPasswordSent".tr)),
        );
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: width / 12, vertical: height / 18),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height / 20),
              SvgPicture.asset(
                'assets/svg/login.svg',
                height: height / 3.75,
              ),
              SizedBox(height: height / 50),
              Text(
                "login.title".tr,
                style: TextStyle(
                    fontSize: height / 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              SizedBox(height: height / 80),
              RichText(
                text: TextSpan(
                  text: "${("login.noAccount".tr)} ",
                  style: TextStyle(color: Colors.grey[700]),
                  children: [
                    TextSpan(
                      text: "login.signUp".tr,
                      style: TextStyle(
                          color: const Color(0xFF8256DF),
                          fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(() => const Register());
                        },
                    ),
                  ],
                ),
              ),
              SizedBox(height: height / 20),
              TextField(
                controller: emailController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "login.emailLabel".tr,
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: height / 30),
              TextField(
                controller: passwordController,
                obscureText: !isPasswordVisible,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: "login.passwordLabel".tr,
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      icon: const Icon(Icons.visibility)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              if (errorMessage != null)
                Padding(
                  padding: EdgeInsets.only(top: height / 50),
                  child: Text(
                    errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              SizedBox(height: height / 30),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: signIn,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8256DF),
                    padding: EdgeInsets.symmetric(
                        vertical: height / 56.33, horizontal: width / 4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    "login.loginButton".tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: height / 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: height / 40),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ResetPassword()),
                  );
                },
                child: Text(
                  "login.forgotPassword".tr,
                  style: TextStyle(
                    color: const Color(0xFF8256DF),
                    fontWeight: FontWeight.bold,
                    fontSize: height / 55,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
