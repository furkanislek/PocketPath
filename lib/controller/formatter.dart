import 'package:intl/intl.dart';

class Formatter {
  final numberFormatter = NumberFormat("#,##0.00");

  String format(double value) {
    return numberFormatter.format(value);
  }

  double parse(String value) {
    return double.tryParse(value.replaceAll(',', '')) ?? 0.0;
  }

  DateTime now = DateTime.now();
  late String timeZoneName;
  late int timeZoneOffset;

  Formatter() {
    timeZoneName = now.timeZoneName;
    timeZoneOffset = now.timeZoneOffset.inHours;
  }

  DateTime FormatterDate(DateTime date) {
    DateTime localDate = date.toLocal();
    return localDate;
  }
}
