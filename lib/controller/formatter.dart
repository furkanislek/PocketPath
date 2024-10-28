import 'package:intl/intl.dart';

class Formatter {
  final numberFormatter = NumberFormat("#,###.00");

  String format(double value) {
    return numberFormatter.format(value);
  }

  double parse(String value) {
    return double.tryParse(value.replaceAll(',', '')) ?? 0.0;
  }
}
