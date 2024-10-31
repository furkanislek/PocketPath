import 'package:pocketPath/controller/formatter.dart';
import 'package:pocketPath/controller/home/cost_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Costs extends StatelessWidget {
  final dynamic costs;

  Costs({
    super.key,
    required this.costs,
  });

  final CostController costController =
      Get.find<CostController>(); // Use Get.find to access the same instance

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    IconData costIcon = Icons.help_outline_sharp;
    Color colorIcon = const Color(0xFF940000);

    if (costs["category"] == "Shopping") {
      costIcon = Icons.shopping_cart_outlined;
      colorIcon = const Color(0xFFE12D48);
    } else if (costs["category"] == "Healthy") {
      costIcon = Icons.local_hospital_outlined;
      colorIcon = const Color(0xFF55BB7D);
    } else if (costs["category"] == "Food") {
      costIcon = Icons.restaurant;
      colorIcon = const Color(0xFF0996C7);
    } else if (costs["category"] == "School") {
      costIcon = Icons.book_outlined;
      colorIcon = const Color(0xFFBD2DE1);
    } else if (costs["category"] == "Holiday") {
      costIcon = Icons.beach_access;
      colorIcon = const Color(0xFF0FCAA6);
    } else if (costs["category"] == "Electronic") {
      costIcon = Icons.help_outline_sharp;
      colorIcon = const Color(0xFFFA904A);
    } else if (costs["category"] == "Other") {
      costIcon = Icons.help_outline_sharp;
      colorIcon = const Color(0xFF2D47D3);
    }

    DateTime date = DateTime.fromMillisecondsSinceEpoch(
        costs['timestamp'] * 1000,
        isUtc: true);

    DateTime userDateTime = date.toLocal();
    String formattedDate = DateFormat('EEEE, dd MMMM').format(userDateTime);

    return GestureDetector(
      onLongPress: () {
        _showDeleteDialog(context, costs['expensesId']);
      },
      child: Container(
        width: double.infinity,
        height: height / 12,
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 50),
              child: SizedBox(
                width: width / 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Color.fromARGB(255, 240, 240, 240),
                        shape: BoxShape.rectangle,
                      ),
                      child: Icon(
                        costIcon,
                        color: colorIcon,
                        size: 24.0,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: width / 1.35,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width / 40,
                        vertical: height / 120,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            costs['name'],
                            style: const TextStyle(color: Color(0xFF3D423F)),
                          ),
                          Text(
                            costs['category'],
                            style: const TextStyle(color: Color(0xFF868B88)),
                          ),
                          Text(
                              '\$ ${Formatter().numberFormatter.format((costs['budget']))}'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width / 40,
                        vertical: height / 120,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            formattedDate,
                            style: const TextStyle(
                                color: Color(0xFF868B88),
                                fontSize: kDefaultFontSize * 0.8),
                          ),
                          Text(
                            costs['isExpense'] ? 'Expense' : 'Income',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: costs['isExpense']
                                    ? const Color(0xFFE12D48)
                                    : const Color(0xFF55BB7D)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, String docId) {
    Get.dialog(
      AlertDialog(
        title: const Text("Delete Cost"),
        content: const Text("Are you sure you want to delete this cost?"),
        actions: [
          TextButton(
            child: const Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text("Delete"),
            onPressed: () {
              costController.deleteCost(docId);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
