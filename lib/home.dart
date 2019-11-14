import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_proj/alarm.dart';
import 'package:test_proj/bedtime.dart';
import 'package:test_proj/stopwatch.dart';
import 'package:test_proj/timer.dart';
import 'package:test_proj/world_clock.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int selectedTabIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            canvasColor: Colors.black.withOpacity(0.8),
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: Color(0xffFF9500),
            textTheme: Theme.of(context).textTheme.copyWith(
                caption: new TextStyle(
                    color: Color(
                        0xffE8AE52)))), // sets the inactive color of the `BottomNavigationBar`
        child: BottomNavigationBar(
          currentIndex: selectedTabIndex,
          onTap: (int selectedTab) {
            setState(() {
              selectedTabIndex = selectedTab;
            });
          },
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(fontSize: 10),
          unselectedLabelStyle: TextStyle(fontSize: 10),
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/world_clock.png')),
              title: Text('World Clock', overflow: TextOverflow.visible),
            ),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/alarm.png')),
                title: Text('Alarm')),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/bedtime.png')),
                title: Text('Bedtime')),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/stopwatch.png')),
                title: Text('StopWatch')),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/timer.png')),
                title: Text('Timer')),
          ],
        ),
      ),
      body: tabContent(),
    );
  }

  Widget tabContent() {
    switch (selectedTabIndex) {
      case 0:
        return WorldClock();
        break;
      case 1:
        return AlarmTab();
        break;
      case 2:
        return BedtimeTab();
        break;
      case 3:
        return StopWatchTab();
        break;
      case 4:
        return TimerTab();
        break;
    }
  }
}
