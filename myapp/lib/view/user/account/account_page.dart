import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/model/account.dart';
import 'package:myapp/model/post.dart';
import 'package:myapp/utils/authentication.dart';
import 'package:myapp/view/user/account/edit_account_page.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  Account myAccount = Authentication.myAccount!;

  List<Post> postList = [
    Post(
        id: '0',
        subject: '英語',
        content: '単語',
        hours: '1',
        minutes: '10',
        createdTime: Timestamp.now()
    ),
    Post(
        id: '1',
        subject: '数学',
        content: '計算',
        hours: '1',
        minutes: '10',
        createdTime: Timestamp.now()
    ),
    Post(
        id: '2',
        subject: '国語',
        content: '漢字',
        minutes: '30',
        createdTime: Timestamp.now()
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
                              onPressed: ()async{
                                var result = await Navigator.push(context, MaterialPageRoute(builder: (context) => const EditAccount()));
                                if(result == true){
                                  setState(() {
                                    myAccount = Authentication.myAccount!;
                                  });
                                }
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
                  child: const Text('投稿', style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  ),
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
                                Text(postList[index].subject, style: const TextStyle(
                                    fontSize:18,
                                    color:Colors.black,
                                    backgroundColor: Colors.yellow)
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(postList[index].content),
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text('${postList[index].hours}時間'),
                                                    Text('${postList[index].minutes}分'),
                                                  ],
                                                ),
                                                const SizedBox(height: 5),
                                                Text(DateFormat('M/d/yyyy').format(postList[index].createdTime!.toDate())),
                                              ],
                                            )
                                          ],
                                        ),
                                      ]
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
