import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  Timer? _timer;
  DateTime? _time;

  @override
  void initState() {
    _time = DateTime.utc(0, 0, 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreenAccent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text('タイマー', style: TextStyle(color: Colors.black)),
          centerTitle: true,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text(
              DateFormat.Hms().format(_time!),
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _timer = Timer.periodic(
                      Duration(seconds: 1),
                          (Timer timer) {
                        setState(() {
                          _time = _time!.add(Duration(seconds: 1));
                        });
                      },
                    );
                  },
                  child: Text("Start"),
                ),
                SizedBox(width: 50),
                ElevatedButton(
                  onPressed: () {
                    if (_timer != null && _timer!.isActive) _timer!.cancel();
                  },
                  child: Text("Stop"),
                ),
              ],
            )
        ]));
  }
}