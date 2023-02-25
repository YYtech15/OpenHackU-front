import 'package:flutter/material.dart';
import 'package:myapp/utils/db/db_helper.dart';

class MyHomePage extends StatelessWidget {

  // DatabaseHelper クラスのインスタンス取得
  final dbHelper = DatabaseHelper.instance;

  // homepage layout
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQLiteデモ'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              child: const Text('登録', style: TextStyle(fontSize: 35),),
              onPressed: _insert,
            ),
            ElevatedButton(
              child: const Text('照会', style: TextStyle(fontSize: 35),),
              onPressed: _query,
            ),
            ElevatedButton(
              child: const Text('更新', style: TextStyle(fontSize: 35),),
              onPressed: _update,
            ),
            ElevatedButton(
              child: const Text('削除', style: TextStyle(fontSize: 35),),
              onPressed: _delete,
            ),
          ],
        ),
      ),
    );
  }

  // 登録ボタンクリック
  void _insert() async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnName : 'YY',
      DatabaseHelper.columnSelfIntroduction  : 'a',
      DatabaseHelper.columnImagePath  : 'a',
    };
    final id = await dbHelper.insert(row);
    print('登録しました。id: $id');
  }

  // 照会ボタンクリック
  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('全てのデータを照会しました。');
    allRows.forEach(print);
  }

  // 更新ボタンクリック
  void _update() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnName : 'YY',
      DatabaseHelper.columnSelfIntroduction  : 'a',
      DatabaseHelper.columnImagePath  : 'b',
    };
    final rowsAffected = await dbHelper.update(row);
    print('更新しました。 ID：$rowsAffected ');
  }

  // 削除ボタンクリック
  void _delete() async {
    final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(id!);
    print('削除しました。 $rowsDeleted ID: $id');
  }
}
