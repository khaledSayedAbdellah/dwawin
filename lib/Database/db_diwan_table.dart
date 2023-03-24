import 'package:dwawin/Models/diwan_model.dart';
import 'package:sqflite/sqflite.dart';
import '../Models/diwan_model.dart';
import '../Models/poem_model.dart';
import 'const.dart';
import 'database_helper.dart';

class DiwanDbHelper{
  // singleton
  factory DiwanDbHelper(){
    _this ??= DiwanDbHelper._();
    return _this!;
  }
  static DiwanDbHelper? _this;
  DiwanDbHelper._();

  final db = DataBaseHelper().db;

  static String tableName = ConstDb.diwanTableName;

  Future<int> insert({required DiwanModel diwan}) async {
    return await db.insert(tableName, diwan.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
  Future<int> insertWithoutNofPoems({required DiwanModel diwan}) async {
    int nOfPoems = (await DiwanDbHelper().getPoemsByDiwanId(id: diwan.id)).length;
    return await db.insert(tableName, (diwan..nOfPoems = nOfPoems).toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
  Future<int> update({required DiwanModel diwan}) async {
    return await db.update(tableName, diwan.toMap(),
      where: '${DiwanModel.idText} = ?', whereArgs: [diwan.id],
    );
  }
  Future<int> delete({required int id}) async {
    return await db.delete(tableName,
      where: '${DiwanModel.idText} = ?', whereArgs: [id],);
  }

  Future<DiwanModel?> getById({required int? id}) async {
    if(id==null) return null;
    List<Map<String,dynamic>> maps = await db.query(tableName,where: '${DiwanModel.idText} = ?',whereArgs: [id]);
    if (maps.isNotEmpty) {
      return DiwanModel.fromMap(maps.first);
    }
    return null;
  }

  Future<List<DiwanModel>> getAllDwawin() async {
    List<Map<String,dynamic>> maps = await db.query(tableName,where: '${DiwanModel.collectionText} = ?',whereArgs: [0]);
    if (maps.isNotEmpty) {
      return maps.map((e) => DiwanModel.fromMap(e)).toList();
    }
    return [];
  }

  Future<List<DiwanModel>> getAllKnash() async {
    List<Map<String,dynamic>> maps = await db.query(tableName,where: '${DiwanModel.collectionText} = ?',whereArgs: [1]);
    if (maps.isNotEmpty) {
      return maps.map((e) => DiwanModel.fromMap(e)).toList();
    }
    return [];
  }

  Future<bool> deleteAll() async {
    int result = await db.rawDelete("delete from $tableName");
    return result!=-1;
  }

  Future<List<PoemModel>> getPoemsByDiwanId({required int? id}) async {
    if(id == null) return [];
    List<Map<String,dynamic>> maps = await db.query(ConstDb.poemTableName,where: '${PoemModel.diwanIdText} = ?',whereArgs: [id]);
    if (maps.isNotEmpty) {
      return maps.map((e) => PoemModel.fromMap(e)).toList();
    }
    return [];
  }

  Future<int> deleteByDiwanId({required int id}) async {
    return await db.delete(ConstDb.poemTableName,
      where: '${PoemModel.diwanIdText} = ?', whereArgs: [id],);
  }
}