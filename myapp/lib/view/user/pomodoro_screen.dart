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
    return Scaffold(
        body: pageList[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.create_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.health_and_safety_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.timer_outlined), label: '')
        ],
        currentIndex: selectedIndex,
        onTap: (index){
        setState(() {
        selectedIndex = index;
        });
      },
    ),
    );
  }
}
