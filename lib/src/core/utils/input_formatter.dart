// ignore_for_file: empty_catches

import 'package:calendar/src/base/base_function.dart';
import 'package:flutter/services.dart';

class DayInputFormatter extends TextInputFormatter {
  int month;
  int year;

  DayInputFormatter(this.month, this.year);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    bool isLeapYear = BaseFunctions.isLeapYear(year);
    if (month == 1 ||
        month == 3 ||
        month == 5 ||
        month == 7 ||
        month == 8 ||
        month == 10 ||
        month == 12) {
      if (text.isNotEmpty && int.parse(text) > 31) {
        return oldValue;
      }
    } else if (month == 4 || month == 6 || month == 9 || month == 11) {
      if (text.isNotEmpty && int.parse(text) > 30) {
        return oldValue;
      }
    } else {
      if (text.isNotEmpty && int.parse(text) > (isLeapYear ? 29 : 28)) {
        return oldValue;
      }
    }
    return newValue;
  }
}

class MonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    if (text.isNotEmpty && int.parse(text) > 12) {
      return oldValue;
    }
    return newValue;
  }
}
