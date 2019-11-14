import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:test_proj/widgets/cupertino_time_picker.dart' as customPickers;

class AddAlarmPopup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddAlarmPopupState();
  }
}

class _AddAlarmPopupState extends State<AddAlarmPopup> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xff1C1C1E),
        ),
        height: MediaQuery.of(context).size.height * 0.95,
        child: Column(
          // padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15)),
                color: Color(0xff28282A),
              ),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Color(0xffE8AE52)),
                    ),
                    onPressed: () {},
                  ),
                  Text(
                    'Add Alarm',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Text(
                      'Save',
                      style: TextStyle(color: Color(0xffE8AE52)),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Container(
              height: 250,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: hourPicker(),
                  ),
                  Expanded(
                    child: minutePicker(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> getHoursOptions() {
    List<Widget> options = List.generate(24, (index) {
      int hour = index;
      return Container(
        height: 30,
        width: MediaQuery.of(context).size.width * 0.3,
        child: Text(
          '$hour',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      );
    });

    return options;
  }

  List<Widget> getMinutesOptions() {
    List<Widget> options = List.generate(60, (index) {
      int hour = index;
      return Container(
        height: 30,
        width: MediaQuery.of(context).size.width * 0.3,
        child: Text(
          '$hour',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      );
    });

    return options;
  }

  Widget hourPicker() {
  return Container(
      color: Colors.black,
      height: 250,
      width: MediaQuery.of(context).size.width,
      child: Container(
        height: 250,
        child: CupertinoPicker(
          useMagnifier: true,
          magnification: 1.4,
          backgroundColor: Color(0xff1C1C1E),
          children: getHoursOptions(),
          itemExtent: 30.toDouble(),
          onSelectedItemChanged: (index) {},
        ),
      ),
    );
  }

  Widget minutePicker() {
    return Container(
      color: Colors.black,
      height: 250,
      width: MediaQuery.of(context).size.width,
      child: Container(
        height: 250,
        child: CupertinoPicker(
          useMagnifier: true,
          magnification: 1.4,
          backgroundColor: Color(0xff1C1C1E),
          children: getMinutesOptions(),
          itemExtent: 30.toDouble(),
          onSelectedItemChanged: (index) {},
        ),
      ),
    );
  }
  //   return Container(
  //     color: Colors.black,
  //     height: 150,
  //     child: CupertinoTheme(
  //       data: CupertinoTheme.of(context).copyWith(
  //         textTheme: CupertinoTextThemeData(dateTimePickerTextStyle: TextStyle(
  //           color: Colors.white
  //         ))
  //       ),
  //       child: customPickers.CupertinoTimerPicker(
  //         backgroundColor: Colors.black,
  //         mode: customPickers.CupertinoTimerPickerMode.hm,
  //         initialTimerDuration: Duration(
  //           hours: DateTime.now().hour,
  //           minutes: DateTime.now().minute,
  //         ),
  //         onTimerDurationChanged: (duration) {},
  //       ),
  //     ),
  //   );
  // }
}
