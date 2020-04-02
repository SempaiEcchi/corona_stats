import 'package:flutter/material.dart';

extension StringExtension on String {
  TimeOfDay convertStringToTimeOfDay() {
    List<String> tmp = this
        .replaceAll(RegExp('TimeOfDay'), '')
        .replaceAll("(", '')
        .replaceAll(")", '')
        .split(':');
    print(tmp);
    return TimeOfDay(hour: int.parse(tmp[0]), minute: int.parse(tmp[1]));
  }

  DateTime convertStringToDateTime() {
    List<dynamic> part = this.split("-").map((e) => int.parse(e)).toList();
    return DateTime(part[0], part[1], part[2]);
  }
}
