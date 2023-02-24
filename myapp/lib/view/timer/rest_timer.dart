import 'package:flutter/material.dart';

import 'package:neon_circular_timer/neon_circular_timer.dart';

class RestTimer extends StatelessWidget {
  RestTimer({super.key});
  final CountDownController controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('休憩用(5分)',style: TextStyle(fontSize: 30)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: NeonCircularTimer(
                onComplete: () {
                  controller.restart();
                },
                width: 200,
                controller: controller,
                duration: 300,
                strokeWidth: 10,
                isTimerTextShown: true,
                neumorphicEffect: true,
                outerStrokeColor: Colors.grey.shade100,
                innerFillGradient: LinearGradient(colors: [
                  Colors.yellowAccent.shade200,
                  Colors.greenAccent.shade400
                ]),
                neonGradient: LinearGradient(colors: [
                  Colors.yellowAccent.shade200,
                  Colors.greenAccent.shade400
                ]),
                strokeCap: StrokeCap.round,
                innerFillColor: Colors.black12,
                backgroudColor: Colors.grey.shade100,
                neonColor: Colors.blue.shade900),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      iconSize: 50,
                      color: Colors.lightBlueAccent,
                      icon: const Icon(Icons.play_circle_outline),
                      onPressed: () {
                        controller.resume();
                      }),
                  IconButton(
                      iconSize: 50,
                      color: Colors.redAccent,
                      icon: const Icon(Icons.pause),
                      onPressed: () {
                        controller.pause();
                      }),
                  IconButton(
                      iconSize: 50,
                      color: Colors.lightGreenAccent,
                      icon: const Icon(Icons.repeat),
                      onPressed: () {
                        controller.restart();
                      }),
                ]),
          )],
      ),
    );
  }
}
