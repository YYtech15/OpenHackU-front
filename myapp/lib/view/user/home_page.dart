import 'package:flutter/material.dart';
import 'package:myapp/view/camera/camera_page.dart';
import 'package:myapp/view/camera/sample_camera.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              const Text('Let’s　Study', style: TextStyle(fontSize: 50, color: Colors.lightBlueAccent),),
              const SizedBox(height: 100),
              IconButton(
                color: Colors.blueAccent,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SampleScreen()));
                },
                iconSize: 100,
                icon: const Icon(Icons.camera_alt_outlined),
              )
          ],
        ),
      )
    );
  }
}
