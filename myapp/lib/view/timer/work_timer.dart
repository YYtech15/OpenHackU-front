import 'package:flutter/material.dart';

import 'package:neon_circular_timer/neon_circular_timer.dart';

class WorkTimer extends StatelessWidget {
  WorkTimer({super.key});
  final CountDownController controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('作業用(25分)',style: TextStyle(fontSize: 30)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: NeonCircularTimer(
                  onComplete: () {
                    controller.restart();
                  },
                  width: 200,
                  controller: controller,
                  duration: 1500,
                  strokeWidth: 10,
                  isTimerTextShown: true,
                  neumorphicEffect: true,
                  outerStrokeColor: Colors.grey.shade100,
                  innerFillGradient: LinearGradient(colors: [
                    Colors.redAccent.shade200,
                    Colors.blueAccent.shade400
                  ]),
                  neonGradient: LinearGradient(colors: [
                    Colors.redAccent.shade200,
                    Colors.blueAccent.shade400
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