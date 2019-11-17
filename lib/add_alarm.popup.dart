import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_proj/alarm_repeat_popup.dart';
import 'package:test_proj/model/alarm.dart';

import 'package:test_proj/widgets/cupertino_time_picker.dart' as customPickers;

class AddAlarmPopup extends StatefulWidget {
  final Function onSave;

  const AddAlarmPopup({Key key, this.onSave}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AddAlarmPopupState();
  }
}

class _AddAlarmPopupState extends State<AddAlarmPopup> {
  Alarm alarm;

  int initalHour;
  int initalMinute;

  @override
  void initState() {
    super.initState();

    initalHour = DateTime.now().hour;
    initalMinute = DateTime.now().minute;

    alarm = Alarm(
        TimeOfDay(
          hour: initalHour,
          minute: initalMinute,
        ),
        true);
  }

  changeAlarm() {
    alarm.time = TimeOfDay(
      hour: initalHour,
      minute: initalMinute,
    );

    print(alarm.time.toString());
  }

  save() {
    widget.onSave(alarm);
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Color(0xffE8AE52)),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Text(
                    'Add Alarm',
                    style: TextStyle(color: Colors.white, fontSize: 19),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Text(
                      'Save',
                      style: TextStyle(color: Color(0xffE8AE52)),
                    ),
                    onPressed: () {
                      save();
                    },
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
            ),
            Expanded(
              child: alarmOptions(),
            ),
            Expanded(
              child: Container(),
            )
          ],
        ),
      ),
    );
  }

  Widget alarmOptions() {
    return Container(
      color: Color(0xff2C2C2E),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: <Widget>[
          listTile(
              name: 'Repeat',
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    alarm.getABBRSelectedDays(),
                    style: TextStyle(color: Color(0xff8E8D92), fontSize: 16),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Color(0xff8E8D92),
                  ),
                ],
              ),
              onTap: () {
                showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return AlarmRepeatPopup(
                        alarm: alarm,
                      );
                    }).then((_) {
                  setState(() {});
                });
              }),
          divider(),
          listTile(
            name: 'Label',
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Alarm',
                  style: TextStyle(color: Color(0xff8E8D92), fontSize: 16),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Color(0xff8E8D92),
                ),
              ],
            ),
          ),
          divider(),
          listTile(
            name: 'Sound',
            trailing: Icon(
              Icons.chevron_right,
              color: Color(0xff8E8D92),
            ),
          ),
          divider(),
          listTile(
            name: 'Snooze',
            trailing: CupertinoSwitch(
              onChanged: (val) {},
              value: true,
            ),
          ),
          divider(),
        ],
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

  List<Widget> getHoursOptions() {
    List<Widget> options = List.generate(24, (index) {
      String hour = index > 9 ? index.toString() : '0$index';
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
      String hour = index > 9 ? index.toString() : '0$index';
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
    // final FixedExtentScrollController scrollController =
    //     FixedExtentScrollController(initialItem: initalHour);
    return Container(
      color: Colors.black,
      height: 250,
      width: MediaQuery.of(context).size.width,
      child: Container(
        height: 250,
        child: CupertinoPicker(
          scrollController:
              FixedExtentScrollController(initialItem: initalHour),
          useMagnifier: true,
          looping: true,
          magnification: 1.4,
          backgroundColor: Color(0xff1C1C1E),
          children: getHoursOptions(),
          itemExtent: 30.toDouble(),
          onSelectedItemChanged: (index) {
            initalHour = index;
            changeAlarm();
          },
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
          scrollController:
              FixedExtentScrollController(initialItem: initalMinute),
          useMagnifier: true,
          looping: true,
          magnification: 1.4,
          backgroundColor: Color(0xff1C1C1E),
          children: getMinutesOptions(),
          itemExtent: 30.toDouble(),
          onSelectedItemChanged: (index) {
            initalMinute = index;
            changeAlarm();
          },
        ),
      ),
    );
  }
}
