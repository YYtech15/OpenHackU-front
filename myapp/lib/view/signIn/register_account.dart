import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/model/account.dart';
import 'package:myapp/utils/authentication.dart';
import 'package:myapp/utils/firestore/user.dart';
import 'package:myapp/utils/function/image_func.dart';

class RegisterAccount extends StatefulWidget {
  const RegisterAccount({Key? key}) : super(key: key);

  @override
  State<RegisterAccount> createState() => _RegisterAccountState();
}

class _RegisterAccountState extends State<RegisterAccount> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(Icons.arrow_back_ios),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () async {
                  var result = await ImageFunc.getImageFromGallery();
                  if(result != null){
                    setState(() {
                      image = File(result.path);
                    });
                  }
                },
                child: CircleAvatar(
                  foregroundImage: image == null ? null : FileImage(image!),
                  radius: 40,
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  child: const Icon(Icons.add),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 220,
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(hintText: '名前', hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                  width: 220,
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(hintText: 'メールアドレス', hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                  width: 220,
                  child: TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(hintText: 'パスワード', hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: 220,
                height: 80,
                child:
                ElevatedButton(
                    onPressed: () async{
                      if(nameController.text.isNotEmpty && image != null && emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
                        var result = await Authentication.signUp(email: emailController.text, pass: passwordController.text);
                        if(result is UserCredential) {
                          String imagePath = await ImageFunc.upLoadImage(result.user!.uid, image!);
                          Account newAccount = Account(
                            id: result.user!.uid,
                            name: nameController.text,
                            imagePath: imagePath,
                          );
                          var resultSet = await UserFireStore.setUser(newAccount);
                          if (resultSet== true) {
                            Navigator.pop(context);
                          }
                        }
                      }
                      else{ print('全ての項目に入力をして下さい'); }
                    },
                    style:
                    ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
                    child: const Text(
                        'アカウント作成',
                      style: TextStyle(color: Colors.white),
                    )
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
