import 'package:intl/intl.dart';

class DateTimeUtils {
  static String getDateStr(DateTime date) {
    return DateFormat('yyyy.MM.dd').format(date);
  }
}
