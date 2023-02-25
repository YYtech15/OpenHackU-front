import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/model/account.dart';
import 'package:myapp/utils/authentication.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseUser {
  static final firestoreInstance = FirebaseFirestore.instance;
  static final CollectionReference users = firestoreInstance.collection('users');

  static final databaseName = "MyDatabase.db"; // DB名
  static final databaseVersion = 1; // スキーマのバージョン指定

  static final userTable = 'user';

  static final columnId = 'id';
  static final columnName = 'name';
  static final columnSelfIntroduction = 'selfIntroduction';
  static final columnImagePath = 'imagePath';
  static final columnCreatedTime = 'createdTime';
  static final columnUpdatedTime = 'updatedTime';


  // DatabaseHelper クラスを定義
  DatabaseUser._privateConstructor();
  // DatabaseHelper._privateConstructor() コンストラクタを使用して生成されたインスタンスを返すように定義
  // DatabaseHelper クラスのインスタンスは、常に同じものであるという保証
  static final DatabaseUser instance = DatabaseUser._privateConstructor();

  // Databaseクラス型のstatic変数_databaseを宣言
  // クラスはインスタンス化しない
  static Database? _database;

  // databaseメソッド定義
  // 非同期処理
  Future<Database?> get database async {
    // _databaseがNULLか判定
    // NULLの場合、_initDatabaseを呼び出しデータベースの初期化し、_databaseに返す
    // NULLでない場合、そのまま_database変数を返す
    // これにより、データベースを初期化する処理は、最初にデータベースを参照するときにのみ実行されるようになります。
    // このような実装を「遅延初期化 (lazy initialization)」と呼びます。
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // データベース接続
  _initDatabase() async {
    // アプリケーションのドキュメントディレクトリのパスを取得
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    // 取得パスを基に、データベースのパスを生成
    String path = join(documentsDirectory.path, databaseName);
    // データベース接続
    return await openDatabase(
        path,
        version: databaseVersion,
        // テーブル作成メソッドの呼び出し
        onCreate: _onCreateUserTable
    );
  }

  // テーブル作成
  // 引数:dbの名前
  // 引数:スキーマーのversion
  // スキーマーのバージョンはテーブル変更時にバージョンを上げる（テーブル・カラム追加・変更・削除など）
  Future _onCreateUserTable(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $userTable (
            $columnId INTEGER PRIMARY KEY,
            $columnName TEXT NOT NULL,
            $columnSelfIntroduction TEXT,
            $columnImagePath TEXT,
            $columnCreatedTime TEXT NOT NULL DEFAULT (DATETIME('now', 'localtime')),
            $columnUpdatedTime TEXT NOT NULL DEFAULT (DATETIME('now', 'localtime')),
          )
          ''');
  }

  static Future<dynamic> setUser(Map<String, dynamic> row)async{
    try {
      Database? db = await instance.database;
      var result = await db!.insert(userTable, row);
      print(result);
      return true;
    } catch(e){
      print('ユーザー登録エラー');
      return false;
    }
  }

  static Future<dynamic> getUser(String uid) async{
    try{

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

  static Future<dynamic> updateUser(Account updateAccount) async{
    try{
      users.doc(updateAccount.id).update({
        'name': updateAccount.name,
        'self_introduction': updateAccount.selfIntroduction,
        'image_path': updateAccount.imagePath,
        'updated_time': DateTime.now(),
      });
      print('編集完了');
      return true;
    } on FirebaseException catch(e){
      print('編集エラー:$e');
      return false;
    }
  }


  // 照会処理
  static Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database? db = await instance.database;
    return await db!.query(userTable);
  }

  // レコード数を確認
  static Future<int?> queryRowCount() async {
    Database? db = await instance.database;
    return Sqflite.firstIntValue(await db!.rawQuery('SELECT COUNT(*) FROM $userTable'));
  }

  //　更新処理
  static Future<int> update(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    int id = row[columnId];
    return await db!.update(userTable, row, where: '$columnId = ?', whereArgs: [id]);
  }

  //　削除処理
  static Future<int> delete(int id) async {
    Database? db = await instance.database;
    return await db!.delete(userTable, where: '$columnId = ?', whereArgs: [id]);
  }
}