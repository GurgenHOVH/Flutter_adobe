import 'dart:async';

import 'package:flutter/material.dart';

class StopWatchTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StopWatchTabState();
  }
}

enum TimerState { Stop, Start }

class _StopWatchTabState extends State<StopWatchTab> {
  List<Map<String, dynamic>> laps = [];

  DateTime timerTime = DateTime(2019, 1, 1, 1, 0, 0, 0);

  Timer timer;

  TimerState timerState = TimerState.Stop;

  startTimer() {
    timerState = TimerState.Start;

    timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        if (timerState == TimerState.Stop) {
          timer.cancel();
        } else {
          timerTime = timerTime.add(Duration(milliseconds: 100));
        }
      });
    });
  }

  stopTime() {
    timerState = TimerState.Stop;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: body(),
    );
  }

  Widget body() {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 4,
          child: time(
            timerTime,
          ),
        ),
        Expanded(flex: 1, child: buttons()),
        Expanded(flex: 2, child: lapList()),
      ],
    );
  }

  Widget buttons() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[lapButton(), startButton()],
      ),
    );
  }

  Widget lapButton() {
    double size = 90;
    Color color = Color(0xff1C1C1D);
    Color textColor = Color(0xff98989E);
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(size / 2),
        ),
        child: Center(
          child: Container(
            alignment: Alignment.center,
            constraints: BoxConstraints(
              maxWidth: size - 7,
              maxHeight: size - 7,
              minWidth: size - 7,
              minHeight: size - 7,
            ),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(size / 2),
              border: Border.all(color: Colors.black, width: 3),
            ),
            child: Text(
              'Lap',
              style: TextStyle(color: textColor, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }

  Widget startButton() {
    double size = 90;
    Color color = Color(0xff1F2A12);
    Color textColor = Color(0xffA6D25B);
    return GestureDetector(
      onTap: () {
        if (timerState == TimerState.Stop) {
          startTimer();
        } else {
          stopTime();
        }
      },
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(size / 2),
        ),
        child: Center(
          child: Container(
            alignment: Alignment.center,
            constraints: BoxConstraints(
              maxWidth: size - 7,
              maxHeight: size - 7,
              minWidth: size - 7,
              minHeight: size - 7,
            ),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(size / 2),
              border: Border.all(color: Colors.black, width: 3),
            ),
            child: Text(
              timerState == TimerState.Stop ? 'Start' : 'Stop',
              style: TextStyle(color: textColor, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }

  Widget lapList() {
    return ListView.separated(
      itemCount: laps.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                laps[index]['lap'].toString(),
                style: TextStyle(color: Colors.white),
              ),
              Text(
                laps[index]['time'].toString(),
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: 1,
          color: Color(0xff98989E),
        );
      },
    );
  }

  Widget time(DateTime datetime) {
    String minute =
        (datetime.minute < 10 ? '0' : '') + datetime.minute.toString();
    String second =
        (datetime.second < 10 ? '0' : '') + datetime.second.toString();

    String millisecond = (datetime.millisecond < 10 ? '0' : '') +
        (datetime.millisecond / 10).round().toString();

    return Container(
      alignment: Alignment.center,
      child: Text(
        '${minute}:${second}.${millisecond}',
        style: TextStyle(
            color: Colors.white, fontSize: 70, fontWeight: FontWeight.w100),
      ),
    );
  }
}
