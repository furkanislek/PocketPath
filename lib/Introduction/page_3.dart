import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

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
                  'assets/svg/cost.svg',
                  height: height / 2,
                ),
                SizedBox(
                  width: double.infinity,
                  child: RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      style: TextStyle(
                          fontSize: height / 50,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.black),
                      children: [
                        TextSpan(text: "${("intro.page3.title".tr)}\n "),
                        TextSpan(text: "intro.page3.text".tr),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height / 15),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "intro.page3.quote".tr,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: height / 80,
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.italic),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "intro.page3.author".tr,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: height / 80,
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.italic),
                  ),
                ),
                SizedBox(height: height / 5),
              ]),
        ));
  }
}
