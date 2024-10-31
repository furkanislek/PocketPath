import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Page2 extends StatelessWidget {
  Page2({super.key});

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
                  'assets/svg/target.svg',
                  height: height / 2,
                ),
                SizedBox(height: height / 50),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: height / 50,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                      "First Step\n You need to set a target for spending control. Once you have a target, you can record your spending. "),
                ),
                SizedBox(height: height / 15),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: height / 80,
                          fontFamily: 'Poppins',
                          fontStyle: FontStyle.italic),
                      "If you set goals and go after them with all the determination you can muster, your gifts will take you places that will amaze you."),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: height / 80,
                          fontFamily: 'Poppins',
                          fontStyle: FontStyle.italic),
                      "- Les Brown"),
                ),
                SizedBox(height: height / 5),
              ]),
        ));
  }
}
