import 'package:flutter/material.dart';

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
              Text('Let’s　Study', style: TextStyle(fontSize: 50, color: Colors.lightBlueAccent),),
              SizedBox(height: 100),
              IconButton(
                color: Colors.blueAccent,
                onPressed: (){

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
