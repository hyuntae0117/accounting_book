import 'package:intl/intl.dart';

class DateTimeUtils {
  static String getDateStr(DateTime date) {
    return DateFormat('yyyy.MM.dd').format(date);
  }

  static String getCalendarTitle(DateTime date) {
    return DateFormat('yyyy년 M월').format(date);
  }
}
