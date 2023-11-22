import 'package:my_achive_idea/data/idea_info.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  late Database database;

  // DB 초기화
  Future<void> initDatabase() async {
    // db 경로가져오기
    String path = join(await getDatabasesPath(), 'archive_idea.db');

    // db 열기 또는 생성
    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
// db 생성 될 때 실행되는 코드
        db.execute('''
    CREATE TABLE IF NOT EXISTS tb_idea (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        motive TEXT,
        content TEXT,
        priority INTEGER,
        feedback TEXT,
        createAt INTEGER
      )
      ''');
      },
    );
  }

  // IdeaInfo 데이터 삽입 Insert
  Future<int> insertIdeaInfo(IdeaInfo idea) async {
    return await database.insert('tb_idea', idea.toMap());
  }

  // IdeaInfo 데이터 조회 select
  Future<List<IdeaInfo>> getAllIdeaInfo() async {
    final List<Map<String, dynamic>> result = await database.query('tb_idea');
    return List.generate(
      result.length,
      (index) {
        return IdeaInfo.fromMap(result[index]);
      },
    );
  }

  // IdeaInfo 데이터 수정 update
  Future<int> updateIdeaInfo(IdeaInfo idea) async {
    return await database.update(
      'tb_idea',
      idea.toMap(),
      where: 'id = ?',
      whereArgs: [idea.id],
    );
  }

  // IdeaInfo 데이터 삭제 delete
  Future<int> deleteIdeaInfo(int id) async {
    return await database.delete(
      'tb_idea',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // db 닫기 (앱 내에서 db 사용하지 않을경우 닫아 줘야함)
  Future<void> closeDatabase() async {
    await database.close();
  }
}
