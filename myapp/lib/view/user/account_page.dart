import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/model/account.dart';
import 'package:myapp/model/post.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  Account myAccount = Account(
      id:'1',
      name:'YY',
      selfIntroduction:'○○大学受験予定',
      createdTime:DateTime.now(),
      updatedTime:DateTime.now()
  );

  List<Post> postList = [
    Post(
        id: '0',
        content: '英語',
        postAccountId: '0',
        createdTime: DateTime.now()
    ),
    Post(
        id: '1',
        content: '数学',
        postAccountId: '1',
        createdTime: DateTime.now()
    ),
    Post(
        id: '2',
        content: '国語',
        postAccountId: '2',
        createdTime: DateTime.now()
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 10, right: 15, left: 15),
                  height: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                foregroundImage: NetworkImage(myAccount.imagePath),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:[Text(myAccount.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)],
                              )
                            ],
                          ),
                          OutlinedButton(
                              onPressed: (){

                              },
                              child: const Text('編集'))
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(myAccount.selfIntroduction)
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    border: Border(
                        top: BorderSide(
                        color: Colors.lightBlueAccent, width: 3
                        ),
                        bottom: BorderSide(
                        color: Colors.lightBlueAccent, width: 3
                        )
                    )
                  ),
                  child: const Text('投稿', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                ),
                Expanded(
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: postList.length,
                        itemBuilder: (context, index){
                          return Container(
                            decoration: BoxDecoration(
                                border: index==0 ? const Border(
                                  top: BorderSide(color: Colors.grey, width: 0),
                                  bottom: BorderSide(color: Colors.grey, width: 0),
                                ) : const Border(bottom: BorderSide(color: Colors.grey, width: 0),)
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 18,
                                  foregroundImage:NetworkImage(myAccount.imagePath),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(myAccount.name,style: const TextStyle(fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                            Text(DateFormat('M/d/yy').format(postList[index].createdTime!))
                                          ],
                                        ),
                                        Text(postList[index].content)
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
