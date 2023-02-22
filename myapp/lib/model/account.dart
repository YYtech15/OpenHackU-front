import 'package:cloud_firestore/cloud_firestore.dart';

class Account{
  String id;
  String name;
  String selfIntroduction;
  String imagePath;
  Timestamp? createdTime;
  Timestamp? updatedTime;

  Account(
    {
      this.id='',
      this.name='',
      this.selfIntroduction='',
      this.imagePath='',
      this.createdTime,
      this.updatedTime
    }
  );
}