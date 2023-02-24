import 'package:flutter/material.dart';
import 'package:myapp/view/studyLog/post_page.dart';
import 'package:myapp/view/user/account/account_page.dart';
import 'package:myapp/view/user/home_page.dart';
import 'package:myapp/view/user/pomodoro_screen.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  int selectedIndex = 1;
  List<Widget> pageList = [const PomodoroScreen(),const HomePage(), const AccountPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightBlue,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.black,
        iconSize: 30,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.timer_outlined), label: ''),
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => const PostPage()));
        },
        child: const Icon(Icons.comment_outlined, color: Colors.white),
      ),
    );
  }
}
