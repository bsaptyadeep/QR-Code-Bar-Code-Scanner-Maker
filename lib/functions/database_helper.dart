import 'package:app/models/model1.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  database() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "app_db.db");
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          '''CREATE TABLE history (id INTEGER PRIMARY KEY, oper TEXT, txt TEXT, date TEXT)''');
    });
    return database;
  }

  Future<int> insertHis(History his) async {
    int hisId = 0;
    Database _db = await database();
    await _db
        .insert('history', his.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace)
        .then((value) {
      hisId = value;
    });
    return hisId;
  }

  Future<List<History>> getHis() async {
    Database _db = await database();
    List<Map<String, dynamic>> hisMap = await _db.query('history');
    return List.generate(hisMap.length, (index) {
      // print(medMap[index]['id']);
      // print(medMap[index]['med']);
      // print(medMap[index]['exp']);
      // print(medMap[index]['eat']);
      return History(
        id: hisMap[index]['id'],
        oper: hisMap[index]['oper'],
        txt: hisMap[index]['txt'],
        date: hisMap[index]['date'],
      );
    });
  }

  Future<int> idlast() async {
    Database _db = await database();
    final List<Map<String, dynamic>> maps = await _db.query('history');
    return maps.length;
  }
}
