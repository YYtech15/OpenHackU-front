import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/model/post.dart';
import 'package:myapp/utils/authentication.dart';
import 'package:myapp/utils/firestore/post.dart';

const  List<String> choices = <String>['国語', '数学', '英語', '理科', '社会'];

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  TextEditingController contentController = TextEditingController();
  TextEditingController hoursController = TextEditingController();
  TextEditingController minutesController = TextEditingController();
  String isSelectedValue = choices.first;
  String subject = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('新規投稿', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.lightBlue,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButton(
                items: choices.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: isSelectedValue,
                onChanged: (String? value) {
                  setState(() {
                    isSelectedValue = value!;
                    subject = value;
                  });
                },
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  maxLength: 100,
                  controller: contentController,
                  decoration: const InputDecoration(hintText: '行った内容', hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                    child: TextField(
                      maxLength: 2,
                      controller: hoursController,
                      decoration: const InputDecoration(hintText: 'hour', hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  ),
                  const Text('時間', style: TextStyle(fontSize: 20),),
                  SizedBox(width: 50),
                  SizedBox(
                    width: 50,
                    child: TextField(
                      maxLength: 2,
                      controller: minutesController,
                      decoration: const InputDecoration(hintText: 'minute', hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  ),
                  const Text('分', style: TextStyle(fontSize: 20)),
                ],
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                    onPressed: () async {
                      if(contentController.text.isNotEmpty){
                        Post newPost = Post(
                          subject: subject,
                          content: contentController.text,
                          postAccountId: Authentication.myAccount!.id,
                          hours: hoursController.text,
                          minutes: minutesController.text,
                          createdTime: DateTime.now()
                        );
                        var result = await PostFireStore.addPost(newPost);
                        if(result == true){
                          print('投稿成功');
                          Navigator.pop(context);
                        }
                        else{
                          print('投稿失敗');
                        }
                      }
                    }, child: const Text('投稿',style: TextStyle(color: Colors.white)),
              )
              )
            ],
          ),
        ),
      ),
    );
  }
}
