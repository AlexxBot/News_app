import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormatUtils {
  static String dateFormat(DateTime? date) {
    return date == null
        ? ""
        : DateFormat('dd MMMM, yyyy' /* , 'es' */).format(date);
  }

  static String timeFormat(DateTime? time) {
    return time == null ? "" : DateFormat('HH:mm:ss' /* , 'es' */).format(time);
  }

  /* static String dateTimeFormat(DateTime? date) {
    return date == null ? "" : DateFormat('dd/MM/yyyy HH:mm:ss').format(date);
  } */

  static String timeFormatJson(TimeOfDay? time) {
    final now = DateTime.now();
    final timeValue = time ?? TimeOfDay.now();
    final dt = DateTime(
        now.year, now.month, now.day, timeValue.hour, timeValue.minute);
    return DateFormat('HH:mm').format(dt);
  }

  static String? dateFormatJson(DateTime? date) {
    return date == null ? null : DateFormat('yyyy-MM-dd').format(date);
  }

  static String? dateTimeFormatJson(DateTime? date) {
    return date == null ? null : DateFormat('yyyy-MM-ddTHH:mm:ss').format(date);
  }
}
