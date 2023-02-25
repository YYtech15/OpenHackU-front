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
              SizedBox(
                height: 220,
                width: 220,
                child:
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SampleScreen()));
                  },
                  icon: const Icon(Icons.camera_alt_outlined, color: Colors.white,),
                  label: const Text('勉強を始める', style: TextStyle(color: Colors.white, fontSize: 26),),
                  style:
                  ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(110.0))),
                ),
            ),
          ],
        ),
      )
    );
  }
}
