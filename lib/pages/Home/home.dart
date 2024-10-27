import 'package:cost_management/components/home/budget.dart';
import 'package:cost_management/components/home/tab_period.dart';
import 'package:cost_management/components/home/title.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      backgroundColor: const Color(0xFFFaFaFa),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: width / 20, vertical: height / 65),
        child: Column(
          children: [
            Row(
              children: [HomeTitle()],
            ),
            SizedBox(height: height / 40),
            const Row(
              children: [Expanded(child: Budget())],
            ),
            SizedBox(height: height / 40),
            Row(
              children: [Expanded(child: TabSelection())],
            ),
          ],
        ),
      ),
    );
  }
}
