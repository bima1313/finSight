import 'package:intl/intl.dart';

extension DatetimeParser on DateTime {
  String toHour() {
    return DateFormat().add_Hm().format(this);
  }

  String toDate() {
    return DateFormat("EEEE, MMMM d").format(this);
  }

  String toDbDate() {
    return DateFormat("y-MM-dd").format(this);
  }

  String toUIMonthYear() {
    return DateFormat("MMMM y").format(this);
  }

  String toDBMonthYear() {
    return DateFormat("y-MM").format(this);
  }

  String formatingDate() {
    final date = DateFormat("y-MM-dd").format(this);
    final time = DateFormat.Hms().format(this);

    return "$date $time";
  }
}
