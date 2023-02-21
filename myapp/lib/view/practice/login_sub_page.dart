import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myapp/view/practice/create_account_sub_page.dart';
import 'package:myapp/view/screen.dart';

class LoginSubPage extends StatefulWidget {
  const LoginSubPage({Key? key}) : super(key: key);

  @override
  State<LoginSubPage> createState() => _LoginSubPageState();
}

class _LoginSubPageState extends State<LoginSubPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 100),
              const Text('勉強監視アプリ', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  width: 300,
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(hintText: '名前', hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
              ),
              Container(
                width: 300,
                child: TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(hintText: 'パスワード', hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
              const SizedBox(height: 30),
              RichText(
                text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: [
                      const TextSpan(text:'アカウントを作成していない方は'),
                      TextSpan(
                          text: 'こちら',
                          style: const TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()..onTap = (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateAccountSubPage()));
                          }
                      ),
                    ]
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Screen()));
                  },
                  child: const Text('ログイン')
              )
            ],
          ),
        ),
      ),
    );
  }
}
