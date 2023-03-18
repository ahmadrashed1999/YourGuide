import 'dart:async';

import 'package:sqflite/sqflite.dart';

class Sql {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDataBase();
      return _db;
    }
    return _db!;
  }

  intialDataBase() async {
    String path = await getDatabasesPath();
    // String path2 = join(path,'test.db'); or
    String path2 = '$path/marks.db';
    Database db = await openDatabase(path2,
        version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return db;
  }

  _onCreate(Database db, int version) async {
    Batch batch = db.batch();
    batch.execute(
        '''CREATE TABLE marks (id  INTEGER  NOT NULL PRIMARY KEY  AUTOINCREMENT,
        name TEXT NOT NULL,
         mark  TEXT NOT NULL
      )''');
    await db.execute('''
        CREATE TABLE timing (id  INTEGER  NOT NULL PRIMARY KEY  AUTOINCREMENT,
          name TEXT NOT NULL,
         timeFrom TEXT NOT NULL,
         timeTo TEXT NOT NULL,
         color TEXT NOT NULL,
         days Text Not Null
      )
          ''');

    await db.execute(
        "CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, description TEXT, color TEXT, day TEXT, hour TEXT, time TEXT,notificationid TEXT,done INTEGER)");
    batch.commit();
  }

  readData(sql) async {
    Database? myDb = await db;
    List<Map> response = await myDb!.rawQuery(sql);
    return response;
  }

  insertData(sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawInsert(sql);
    return response;
  }

  updateData(sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawUpdate(sql);
    return response;
  }

  deleteData(sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawDelete(sql);
    return response;
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) {
    // print("onUpgrade =====================================");
  }

  deleteMyDataBase() async {
    String path = await getDatabasesPath();
    String path2 = '$path/marks.db';
    return await deleteDatabase(path2);
  }

  //====== methods for notes table ======
  //======short methodes for queries======
  read(table) async {
    Database? myDb = await db;
    List<Map> response = await myDb!.query(table);
    return response;
  }

  insert(table, Map<String, Object?> values) async {
    Database? myDb = await db;
    int response = await myDb!.insert(table, values);
    return response;
  }

  update(table, Map<String, Object?> values, where) async {
    Database? myDb = await db;
    int response =
        await myDb!.update(table, values, where: where); //where: 'id = ?'
    return response;
  }

  delete(table, where) async {
    Database? myDb = await db;
    int response = await myDb!.delete(table, where: where); //where: 'id = ?'
    return response;
  }

  Future<void> createTable(
      String tableName, Map<String, String> columns) async {
    final dbf = await db;
    String query = "CREATE TABLE $tableName (";
    columns.forEach((key, value) {
      query += "$key $value,";
    });
    query = query.substring(0, query.length - 1);
    query += ")";
    await dbf!.execute(query);
  }

  close() {
    _db!.close();
  }

  Future<List<Map<String, dynamic>>> query(tablename) async {
    Database? myDb = await db;
    return await myDb!.query(
      tablename,
    );
  }
}
