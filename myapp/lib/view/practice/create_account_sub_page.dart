import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateAccountSubPage extends StatefulWidget {
  const CreateAccountSubPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountSubPage> createState() => _CreateAccountSubPageState();
}

class _CreateAccountSubPageState extends State<CreateAccountSubPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  File? image;
  ImagePicker picker = ImagePicker();

  Future<void> getImageFromGallery() async{
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if(pickedFile != null){
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

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
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 30),
              Container(
                width: 300,
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(hintText: '名前', hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  width: 300,
                  child: TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(hintText: 'パスワード', hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
              ),
              Container(
                  width: 300,
                  child: TextField(
                    controller: confirmPasswordController,
                    decoration: const InputDecoration(hintText: 'パスワードの確認', hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
              SizedBox(height: 100),
              ElevatedButton(
                  onPressed: (){
                    if(nameController.text.isNotEmpty
                        && passwordController.text.isNotEmpty
                        && confirmPasswordController.text.isNotEmpty) {
                      Navigator.pop(context);
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
