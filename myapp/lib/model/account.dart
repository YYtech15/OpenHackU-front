class Account{
  String id;
  String name;
  String selfIntroduction;
  String imagePath;
  DateTime? createdTime;
  DateTime? updatedTime;

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