import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/view/signIn/sample_login_page.dart';
import 'package:myapp/view/signIn/login_page.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StudyCamera',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: SampleLoginPage(),
    );
  }
}