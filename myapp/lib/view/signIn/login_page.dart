import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myapp/view/screen.dart';
import 'package:myapp/view/signIn/create_account_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.blue.withAlpha(30),
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
                    controller: emailController,
                    decoration: const InputDecoration(hintText: 'メールアドレス', hintStyle: TextStyle(color: Colors.grey)),
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateAccountPage()));
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
