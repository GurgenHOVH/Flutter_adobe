import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_proj/add_alarm.popup.dart';
import 'package:test_proj/model/alarm.dart';

class AlarmTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AlarmTabState();
  }
}

class _AlarmTabState extends State<AlarmTab> {
  List<Alarm> alarms = [
    // Alarm(TimeOfDay(hour: 17, minute: 17), true,
    //     saturday: true, monday: true, thursday: true),
    // Alarm(TimeOfDay(hour: 7, minute: 15), false, monday: true),
    // Alarm(TimeOfDay(hour: 5, minute: 30), false, saturday: true, sunday: true),
    // Alarm.everyday(
    //   TimeOfDay(hour: 10, minute: 30),
    //   true,
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Text(
            'Edit',
            style: TextStyle(color: Color(0xffE8AE52)),
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          CupertinoButton(
            padding: EdgeInsets.zero,
            child: Icon(Icons.add, color: Color(0xffE8AE52)),
            onPressed: () {
              addClock();
            },
          ),
        ],
        bottom: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 30),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Alarm',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
      ),
      body: body(),
    );
  }

  Widget body() {
    Color disabledTextColor = CupertinoColors.inactiveGray;
    Color enabledTextColor = CupertinoColors.white;

    return ListView.separated(
        itemCount: alarms.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(
                alarms[index].time.format(context),
                style: TextStyle(
                    color: alarms[index].status
                        ? enabledTextColor
                        : disabledTextColor,
                    fontSize: 40,
                    fontWeight: FontWeight.w200),
              ),
              subtitle: Text(
                alarms[index].getSelectedDays(),
                style: TextStyle(
                    color: alarms[index].status
                        ? enabledTextColor
                        : disabledTextColor),
              ),
              trailing: Theme(
                data: Theme.of(context)
                    .copyWith(unselectedWidgetColor: Colors.red),
                child: CupertinoSwitch(
                  value: alarms[index].status,
                  onChanged: (val) {
                    setState(() {
                      alarms[index].status = val;
                    });
                  },
                ),
              ));
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: alarms[index].status ? enabledTextColor : disabledTextColor,
            indent: 15,
          );
        });
  }

  saveAlarm(Alarm alarm) {
    Navigator.of(context).pop();
    setState(() {
      alarms.add(alarm);
    });
  }

  void addClock() {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return AddAlarmPopup(onSave: saveAlarm);
        });
  }
}
