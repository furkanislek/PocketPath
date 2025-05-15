import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Page1 extends StatelessWidget {
  Page1({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Container(
        height: height,
        color: const Color.fromARGB(255, 201, 238, 238),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/svg/money.svg',
                  height: height / 2,
                ),
                SizedBox(height: height / 50),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "intro.page1.text".tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: height / 50,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                SizedBox(height: height / 5),
              ]),
        ));
  }
}
