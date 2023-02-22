import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/model/account.dart';
import 'package:myapp/utils/authentication.dart';

class UserFireStore{
  static final _firestoreInstance = FirebaseFirestore.instance;
  static final CollectionReference users = _firestoreInstance.collection('users');

  static Future<dynamic> setUser(Account newAccount)async{
    try{
      await users.doc(newAccount.id).set({
        'name': newAccount.name,
        'self_introduction': newAccount.selfIntroduction,
        'image_path' : newAccount.imagePath,
        'created_time' : Timestamp.now(),
        'updated_time' : Timestamp.now(),
      });
      print('新規ユーザー作成完了');
      return true;
    } on FirebaseException catch(e){
      print('新規ユーザー作成エラー：$e');
    }
    return false;
  }

  static Future<dynamic> getUser(String uid) async{
    try{
      DocumentSnapshot documentSnapshot = await users.doc(uid).get();
      Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
      Account myAccount = Account(
        id: uid,
        name: data['name'],
        selfIntroduction: data['self_introduction'],
        imagePath: data['image_path'],
        createdTime: data['created_time'],
        updatedTime: data['updated_time']
      );
      print('ユーザーデータ取得');
      Authentication.myAccount = myAccount;
      return true;
    } on FirebaseException catch(e){
      print('ユーザーデータ取得エラー:$e');
      return false;
    }
  }
}