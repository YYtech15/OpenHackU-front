import 'package:flutter/material.dart';
import 'package:myapp/view/timer/rest_timer.dart';
import 'package:myapp/view/timer/timer_page.dart';
import 'package:myapp/view/timer/work_timer.dart';

class PomodoroScreen extends StatefulWidget {
  const PomodoroScreen({Key? key}) : super(key: key);

  @override
  State<PomodoroScreen> createState() => _PomodoroScreenState();
}

class _PomodoroScreenState extends State<PomodoroScreen> {
  int selectedIndex = 0;
  List<Widget> pageList = [WorkTimer(), RestTimer(), TimerPage()];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0, // 最初に表示するタブ
      length: 3, // タブの数
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('各種タイマー')),
          bottom: TabBar(
            tabs: const <Widget>[
              Tab(icon: Icon(Icons.create)),
              Tab(icon: Icon(Icons.health_and_safety_outlined)),
              Tab(icon: Icon(Icons.timer_outlined)),
            ],
            onTap: (index){
                setState(() {
                  selectedIndex = index;
                });
            },
          ),
        ),
        body: pageList[selectedIndex],
        ),
      );
  }
}
