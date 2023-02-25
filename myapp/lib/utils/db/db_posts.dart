import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {

  static final databaseName = "MyDatabase.db"; // DB名
  static final databaseVersion = 1; // スキーマのバージョン指定

  static final postTable = 'my_posts';

  static final columnId = 'id';
  static final columnSubject = 'subject';
  static final columnContent = 'content';
  static final columnPostAccountId = 'postAccountId';
  static final columnHours = 'hours';
  static final columnMinutes = 'minutes';
  static final columnCreatedTime = 'createdTime';
  static final columnUpdatedTime = 'updatedTime';

  // DatabaseHelper クラスを定義
  DatabaseHelper._privateConstructor();
  // DatabaseHelper._privateConstructor() コンストラクタを使用して生成されたインスタンスを返すように定義
  // DatabaseHelper クラスのインスタンスは、常に同じものであるという保証
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

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
        onCreate: _onCreatePostTable
    );
  }

  // テーブル作成
  // 引数:dbの名前
  // 引数:スキーマーのversion
  // スキーマーのバージョンはテーブル変更時にバージョンを上げる（テーブル・カラム追加・変更・削除など）
  Future _onCreatePostTable(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $postTable (
            $columnId INTEGER PRIMARY KEY,
            $columnSubject TEXT NOT NULL,
            $columnContent TEXT NOT NULL,
            $columnPostAccountId TEXT NOT NULL,
            $columnHours TEXT NOT NULL,
            $columnMinutes TEXT NOT NULL,
            $columnCreatedTime TEXT NOT NULL DEFAULT (DATETIME('now', 'localtime')),
            $columnUpdatedTime TEXT NOT NULL DEFAULT (DATETIME('now', 'localtime')),
          )
          ''');
  }

  // 登録処理
  Future<int> insert(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(postTable, row);
  }

  // 照会処理
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database? db = await instance.database;
    return await db!.query(postTable);
  }

  // レコード数を確認
  Future<int?> queryRowCount() async {
    Database? db = await instance.database;
    return Sqflite.firstIntValue(await db!.rawQuery('SELECT COUNT(*) FROM $postTable'));
  }

  //　更新処理
  Future<int> update(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    int id = row[columnId];
    return await db!.update(postTable, row, where: '$columnId = ?', whereArgs: [id]);
  }

  //　削除処理
  Future<int> delete(int id) async {
    Database? db = await instance.database;
    return await db!.delete(postTable, where: '$columnId = ?', whereArgs: [id]);
  }
}