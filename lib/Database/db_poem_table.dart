import 'package:dwawin/Models/poem_model.dart';
import 'package:sqflite/sqflite.dart';
import 'const.dart';
import 'database_helper.dart';

class PoemDbHelper{
  // singleton
  factory PoemDbHelper(){
    _this ??= PoemDbHelper._();
    return _this!;
  }
  static PoemDbHelper? _this;
  PoemDbHelper._();

  final db = DataBaseHelper().db;

  static String tableName = ConstDb.poemTableName;

  Future<int> insert({required PoemModel poem}) async {
    return await db.insert(tableName, poem.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
  Future<int> update({required PoemModel poem}) async {
    return await db.update(tableName, poem.toMap(),
      where: '${PoemModel.idText} = ?', whereArgs: [poem.id],
    );
  }
  Future<int> delete({required int id}) async {
    return await db.delete(tableName,
      where: '${PoemModel.idText} = ?', whereArgs: [id],);
  }

  Future<PoemModel?> getById({required int id}) async {
    List<Map<String,dynamic>> maps = await db.query(tableName,where: '${PoemModel.idText} LIKE ?',whereArgs: ['%$id%']);
    if (maps.isNotEmpty) {
      return PoemModel.fromMap(maps.first);
    }
    return null;
  }

  Future<List<PoemModel>> getAll() async {
    List<Map<String,dynamic>> maps = await db.query(tableName);
    if (maps.isNotEmpty) {
      return maps.map((e) => PoemModel.fromMap(e)).toList();
    }
    return [];
  }

  Future<bool> deleteAll() async {
    int result = await db.rawDelete("delete from $tableName");
    return result!=-1;
  }
}