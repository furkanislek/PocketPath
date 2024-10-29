import 'package:cost_management/pages/Login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Confirm extends StatelessWidget {
  Confirm({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Container(
            height: height,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/svg/confirm.svg',
                  height: height / 5,
                  width: double.infinity,
                ),
                SizedBox(height: height / 30),
                Text(
                  "Check your e-mail",
                  style: TextStyle(
                      fontSize: height / 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0E254D)),
                ),
                SizedBox(height: height / 30),
                Text(
                  "We have sent you informations\n to reset your password",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: height / 70, color: Colors.black87),
                ),
                SizedBox(height: height / 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: width / 9),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.off(() => const Login());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8256DF),
                      padding: EdgeInsets.symmetric(
                          vertical: height / 56.33, horizontal: width / 4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      "Confirm",
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
      ),
    );
  }
}
