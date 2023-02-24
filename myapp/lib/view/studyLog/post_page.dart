import 'package:flutter/material.dart';
import 'package:myapp/utils/dropdown_list.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  TextEditingController subjectController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController hoursController = TextEditingController();
  TextEditingController minutesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('新規投稿', style: TextStyle(color: Colors.black)),
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
              const DropdownList(),
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
                child: ElevatedButton(onPressed: (){

                }, child: const Text('投稿')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
