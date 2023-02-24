import 'dart:io';
import 'package:flutter/material.dart';
import 'package:myapp/model/account.dart';
import 'package:myapp/utils/authentication.dart';
import 'package:myapp/utils/firestore/user.dart';
import 'package:myapp/utils/function/image_func.dart';

class EditAccount extends StatefulWidget {
  const EditAccount({Key? key}) : super(key: key);

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  Account myAccount = Authentication.myAccount!;
  TextEditingController nameController = TextEditingController();
  TextEditingController selfIntroductionController = TextEditingController();
  File? image;

  ImageProvider getImage(){
    if(image == null){
      return NetworkImage(myAccount.imagePath);
    }else {
      return FileImage(image!);
    }
  }

  @override
  void initState(){
    super.initState();
    nameController = TextEditingController(text: myAccount.name);
    selfIntroductionController = TextEditingController(text: myAccount.selfIntroduction);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('ユーザー編集', style: TextStyle(color: Colors.black)),
        centerTitle: true,
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
                    foregroundImage: getImage(),
                    radius: 40,
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    child: const Icon(Icons.add),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(hintText: '名前', hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: selfIntroductionController,
                    decoration: const InputDecoration(hintText: '自己紹介', hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
                const SizedBox(height: 100),
                ElevatedButton(
                    onPressed: () async{
                      if(nameController.text.isNotEmpty && selfIntroductionController.text.isNotEmpty) {
                        String imagePath =  '';
                        if(image == null){
                          imagePath = myAccount.imagePath;
                        }else{
                          var result = await ImageFunc.upLoadImage(myAccount.id, image!);
                          imagePath = result;
                        }
                        Account updateAccount = Account(
                          id: myAccount.id,
                          name: nameController.text,
                          selfIntroduction: selfIntroductionController.text,
                          imagePath: imagePath
                        );
                        Authentication.myAccount = updateAccount;
                        var result = await UserFireStore.updateUser(updateAccount);
                        if(result == true) {
                          Navigator.pop(context, true);
                        }
                      }
                      else{ print('全ての項目に入力をして下さい'); }
                    },
                    child: const Text('編集完了',style: TextStyle(color: Colors.white),))
              ],
          ),
        ),
      ),
    );
  }
}
