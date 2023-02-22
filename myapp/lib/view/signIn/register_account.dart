import 'package:flutter/material.dart';
import 'package:myapp/utils/authentication.dart';

class RegisterAccount extends StatefulWidget {
  const RegisterAccount({Key? key}) : super(key: key);

  @override
  State<RegisterAccount> createState() => _RegisterAccountState();
}

class _RegisterAccountState extends State<RegisterAccount> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('新規登録', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 30),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(hintText: '名前', hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(hintText: 'メールアドレス', hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(hintText: 'パスワード', hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
              ),
              const SizedBox(height: 100),
              ElevatedButton(
                  onPressed: () async{
                    if(nameController.text.isNotEmpty && emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
                      var result = await Authentication.signUp(email: emailController.text, pass: passwordController.text);
                      if(result==true) {
                        Navigator.pop(context);
                      }
                    }
                    else{ print('全ての項目に入力をして下さい'); }
                  },
                  child: const Text('アカウント作成'))
            ],
          ),
        ),
      ),
    );
  }
}
