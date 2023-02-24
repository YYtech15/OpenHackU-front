import 'package:cloud_firestore/cloud_firestore.dart';

class Post{
  String id;
  String subject;
  String content;
  String postAccountId;
  String hours;
  String minutes;
  Timestamp? createdTime;

  Post(
      {
        this.id='',
        this.subject='',
        this.content='',
        this.postAccountId='',
        this.hours = '0',
        this.minutes = '0',
        this.createdTime
      }
  );
}