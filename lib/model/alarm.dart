import 'package:flutter/material.dart';

const List<String> weekdays = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday'
];

class Alarm {
  final TimeOfDay time;
  bool status;
  final bool everyDay;

  // Weekdats
  final bool monday;
  final bool tuesday;
  final bool wednesday;
  final bool thursday;
  final bool friday;
  final bool saturday;
  final bool sunday;

  final List<bool> selectedWeekdays;

  Alarm(
    this.time,
    this.status, {
    this.monday = false,
    this.tuesday = false,
    this.wednesday = false,
    this.thursday = false,
    this.friday = false,
    this.saturday = false,
    this.sunday = false,
  })  : selectedWeekdays = [
          monday,
          tuesday,
          wednesday,
          thursday,
          friday,
          saturday,
          sunday,
        ],
        everyDay = false;

  Alarm.everyday(this.time, this.status)
      : everyDay = true,
        monday = false,
        tuesday = false,
        wednesday = false,
        thursday = false,
        friday = false,
        saturday = false,
        sunday = false,
        selectedWeekdays = [true, true, true, true, true, true, true];

  String getSelectedDays() {
    if (everyDay) {
      return "Everyday";
    }

    if (monday &&
        tuesday &&
        wednesday &&
        thursday &&
        friday &&
        saturday &&
        sunday) {
      return "Everyday";
    }

    if (saturday && sunday) {
      return "Weekends";
    }

    if (!saturday &&
        !sunday &&
        monday &&
        tuesday &&
        wednesday &&
        thursday &&
        friday) {
      return "Weekdays";
    }

    String selected = "";

    for (var i = 0; i < selectedWeekdays.length; i++) {
      if (selectedWeekdays[i]) {
        selected += weekdays[i] + ", ";
      }
    }

    selected = selected.substring(0, selected.length - 2);

    return selected;
  }
}
