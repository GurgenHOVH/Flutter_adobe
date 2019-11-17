import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_proj/model/alarm.dart';

import 'package:test_proj/widgets/cupertino_time_picker.dart' as customPickers;

class AlarmRepeatPopup extends StatefulWidget {
  final Alarm alarm;

  const AlarmRepeatPopup({Key key, this.alarm}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AlarmRepeatPopupState();
  }
}

class _AlarmRepeatPopupState extends State<AlarmRepeatPopup> {
  List<Map<String, bool>> weekdays;

  changeAlarm() {
    weekdays.forEach((weekday) {
      switch (weekday.keys.first) {
        case "Monday":
          widget.alarm.monday = weekday.values.first;
          break;
        case "Tuesday":
          widget.alarm.tuesday = weekday.values.first;
          break;
        case "Wednesday":
          widget.alarm.wednesday = weekday.values.first;
          break;
        case "Thursday":
          widget.alarm.thursday = weekday.values.first;
          break;
        case "Friday":
          widget.alarm.friday = weekday.values.first;
          break;
        case "Saturday":
          widget.alarm.saturday = weekday.values.first;
          break;
        case "Sunday":
          widget.alarm.sunday = weekday.values.first;
          break;
      }
    });

    widget.alarm.update();
  }

  @override
  void initState() {
    super.initState();

    weekdays = [
      {'Monday': widget.alarm.monday},
      {'Tuesday': widget.alarm.tuesday},
      {'Wednesday': widget.alarm.wednesday},
      {'Thursday': widget.alarm.thursday},
      {'Friday': widget.alarm.friday},
      {'Saturday': widget.alarm.saturday},
      {'Sunday': widget.alarm.sunday},
    ];
  }

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
                children: <Widget>[
                  Expanded(
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.arrow_back_ios, color: Color(0xffE8AE52)),
                          Text(
                            'Back',
                            style: TextStyle(color: Color(0xffE8AE52)),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Text(
                    'Repeat',
                    style: TextStyle(color: Colors.white, fontSize: 19),
                  ),
                  Expanded(
                    child: Container(),
                  )
                ],
              ),
            ),
            repeatOptions(),
          ],
        ),
      ),
    );
  }

  Widget repeatOptions() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff2C2C2E),
      ),
      margin: EdgeInsets.only(top: 30),
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: weekdays.length,
        itemBuilder: (context, index) {
          String weekname = weekdays[index].keys.first;
          bool isSelected = weekdays[index].values.first;

          return listTile(
              name: 'Every $weekname',
              trailing: isSelected
                  ? Icon(
                      Icons.check,
                      color: Color(0xffE8AE52),
                    )
                  : null,
              onTap: () {
                setState(() {
                  weekdays[index][weekname] = !weekdays[index][weekname];
                });

                changeAlarm();

                print(widget.alarm.getSelectedDays());
              });
        },
        separatorBuilder: (context, index) {
          return divider();
        },
      ),
    );
  }

  Widget listTile({String name, Widget trailing, Function onTap}) {
    return ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        title: Text(
          name,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        trailing: trailing);
  }

  Widget divider() {
    return Divider(
      height: 1,
      color: Color(0xff444346),
      indent: 10,
    );
  }
}
