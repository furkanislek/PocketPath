import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                  child: Text(
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: height / 50,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                      "Second step\n You can see the goals and set spending and income accordingly. You can keep track of your periodic expenditures, and your finished targets. "),
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
                      "There is no favorable wind for the sailor who doesn’t know where to go."),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: height / 80,
                          fontFamily: 'Poppins',
                          fontStyle: FontStyle.italic),
                      "- Seneca"),
                ),
                SizedBox(height: height / 5),
              ]),
        ));
  }
}
