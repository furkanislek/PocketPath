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
          errorText = "You entered an invalid e-mail address.";
          break;
        case 'user-disabled':
          errorText = "The user has been deactivated.";
          break;
        case 'user-not-found':
        case 'invalid-credential':
        case 'wrong-password':
          errorText = "The information entered is incorrect. Please try again.";
          break;
        case 'email-already-in-use':
          errorText = "This email address is already in use.";
          break;
        case 'operation-not-allowed':
          errorText = "This process was not allowed.";
          break;
        case 'email-not-verified':
          errorText = 'Please verify your email address before logging in.';
        default:
          errorText = "An error has occurred. Please try again later.";
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
        errorMessage = "Lütfen e-posta adresinizi girin.";
      });
      return;
    }
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text("Şifre sıfırlama e-postası gönderildi!")),
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
                "Login into your account",
                style: TextStyle(
                    fontSize: height / 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              SizedBox(height: height / 80),
              RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(color: Colors.grey[700]),
                  children: [
                    TextSpan(
                      text: "Sign Up",
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
                  labelText: "Your e-mail",
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
                  labelText: "Type your password",
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
                    "Login",
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
                  "Forgot Password?",
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
