class Post{
  String id;
  String subject;
  String content;
  String hours;
  String minutes;
  DateTime? createdTime;

  Post(
      {
        this.id='',
        this.subject='',
        this.content='',
        this.hours = '0',
        this.minutes = '',
        this.createdTime
      }
  );
}