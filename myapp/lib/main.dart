import 'package:flutter/material.dart';
import 'package:myapp/view/practice/login_sub_page.dart';
import 'package:myapp/view/signIn/login_page.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const LoginSubPage(),
    );
  }
}