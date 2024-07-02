import 'dart:io' show Directory;

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseHelper {
  static const _databaseName = "MyFitnessApp.db";
  static const _databaseVersion = 1;
  static const table = 'my_table';
  static const columnId = '_id';
  static const columnName = 'name';
  static const columnAge = 'age';
  static const columnWeight = 'weight';
  static const columnHeightFeet = 'heightfeet';
  static const columnHeightInch = 'heightinch';
  static const columnGoal = 'goal';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _db;
  Future<Database> get database async {
    if (_db != null) return _db!;

    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;

    _db = await _initDatabase();

    return _db!;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
$columnId INTEGER PRIMARY KEY,
$columnName TEXT NOT NULL,
$columnAge INTEGER NOT NULL,
$columnWeight INTEGER NOT NULL,
$columnHeightFeet INTEGER NOT NULL,
$columnHeightInch INTEGER NOT NULL,
$columnGoal INTEGER NOT NULL
)
      ''');
  }

// Helper methods
// Inserts a row in the database where each key in the
//Map is a column name
// and the value is the column value. The return value
//is the id of the
// inserted row.
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await DatabaseHelper.instance.database;

    return await db.insert(table, row);
  }

// All of the rows are returned as a list of maps, where each map is
// a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await DatabaseHelper.instance.database;
    return await db.query(table);
  }

// All of the methods (insert, query, update, delete) can also be done using
// raw SQL commands. This method uses a raw query to give the row count.
  Future<int> queryRowCount() async {
    Database db = await DatabaseHelper.instance.database;
    final results = await db.rawQuery('SELECT COUNT(*) FROM $table');
    return Sqflite.firstIntValue(results) ?? 0;
  }

  Future<List<Map<String, dynamic>>> queryById(int recordID) async {
    Database db = await DatabaseHelper.instance.database;
    final results = await db.query('$table WHERE $columnId = $recordID');
    return results;
  }

// We are assuming here that the id column in the map is set. The other
// column values will be used to update the row.
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await DatabaseHelper.instance.database;
    int id = row[columnId];
    return await db.update(
      table,
      row,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

// Deletes the row specified by the id. The number of affected rows is
// returned. This should be 1 as long as the row exists.
  Future<int> delete(int id) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.delete(
      table,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  Future<bool> deleteDB() async {
    await databaseFactory.deleteDatabase(_databaseName);
    /*await _db.execute('''
DELETE $table 
''');*/
    return true;
  }

  // Deletes all the rows. The number of affected rows is
// returned. This should be 1 as long as the row exists.
  Future<int> deleteAll() async {
    Database db = await DatabaseHelper.instance.database;
    return await db.delete(table);
  }
}
