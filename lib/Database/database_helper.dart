import 'package:dwawin/Database/db_diwan_table.dart';
import 'package:dwawin/Database/db_poem_table.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'const.dart';

class DataBaseHelper {
  // singleton
  factory DataBaseHelper() {
    _this ??= DataBaseHelper._();
    return _this!;
  }
  static DataBaseHelper? _this;
  DataBaseHelper._();

  late Database db;

  Future init()async {
    db = await openDatabase(
        join(await getDatabasesPath(), ConstDb.dbName),
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(ConstDb.createDiwanTable);
          await db.execute(ConstDb.createPoemTable);
          await db.execute(ConstDb.createVerseTable);
        }
    );
  }

  Future deleteDataBase() async {
    await deleteDatabase(join(await getDatabasesPath(), ConstDb.dbName));
  }

  Future clearDataBase() async{
    await PoemDbHelper().deleteAll();
    await DiwanDbHelper().deleteAll();
  }

}
