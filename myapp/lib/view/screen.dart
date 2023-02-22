import 'package:flutter/material.dart';
import 'package:myapp/view/user/account_page.dart';
import 'package:myapp/view/user/data_page.dart';
import 'package:myapp/view/user/home_page.dart';
import 'package:myapp/view/user/timer_page.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  int selectedIndex = 0;
  List<Widget> pageList = [const DataPage(),const HomePage(), const AccountPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.stacked_bar_chart_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.perm_identity_outlined), label: '')
        ],
        currentIndex: selectedIndex,
        onTap: (index){
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => TimerPage()));
        },
        child: const Icon(Icons.photo_camera_outlined),
      ),
    );
  }
}
