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

const List<String> abbrWeekdays = [
  'Mn',
  'Td',
  'Wd',
  'Th',
  'Fr',
  'St',
  'Sn'
];

class Alarm {
  TimeOfDay time;
  bool status;
  bool everyDay;

  // Weekdats
  bool monday;
  bool tuesday;
  bool wednesday;
  bool thursday;
  bool friday;
  bool saturday;
  bool sunday;

  List<bool> selectedWeekdays;

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

  void update() {
    selectedWeekdays = [
      monday,
      tuesday,
      wednesday,
      thursday,
      friday,
      saturday,
      sunday,
    ];
  }

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

    if (selected == "") {
      selected = "Never";
    } else {
      selected = selected.substring(0, selected.length - 2);
    }

    return selected;
  }

  getABBRSelectedDays() {
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
        selected += abbrWeekdays[i] + ", ";
      }
    }

    if (selected == "") {
      selected = "Never";
    } else {
      selected = selected.substring(0, selected.length - 2);
    }

    return selected;
  }
}
