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

  Future<PoemModel?> getById({required int? id}) async {
    if(id==null) return null;
    List<Map<String,dynamic>> maps = await db.query(tableName,where: '${PoemModel.idText} = ?',whereArgs: [id]);
    if (maps.isNotEmpty) {
      return PoemModel.fromMap(maps.first);
    }
    return null;
  }

  Future<List<PoemModel>> getAll({List<int> dwawinIds = const []}) async {
    List<Map<String,dynamic>> maps = await db.query(tableName,where: '${PoemModel.diwanIdText} IN (${dwawinIds.map((e) => "?").join(', ')})',whereArgs: dwawinIds);
    // List<Map<String,dynamic>> maps = await db.query(tableName);
    if (maps.isNotEmpty) {
      return maps.map((e) => PoemModel.fromMap(e)).toList();
    }
    return [];
  }

  Future<bool> deleteAll() async {
    int result = await db.rawDelete("delete from $tableName");
    return result!=-1;
  }

  Future<int> addNotes({required int? poemId,required String? note}) async {
    if(poemId == null) return -1;
    PoemModel? poemModel =await getById(id: poemId);
    if(poemModel == null) return -1;
    poemModel..notes = note;
    return await update(poem: poemModel);
  }

  Future<List<PoemModel>> getPoemsNote() async {
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM $tableName WHERE ${PoemModel.noteText} IS NOT NULL");
    if (maps.isNotEmpty) {
      return maps.map((e) => PoemModel.fromMap(e)).toList();
    }
    return [];
  }

  Future<int> changePoemFavorite({required int? poemId,required bool status}) async {
    if(poemId == null) return -1;
    PoemModel? poemModel =await getById(id: poemId);
    if(poemModel == null) return -1;
    poemModel..isFave = status;
    return await update(poem: poemModel);
  }

  Future<List<PoemModel>> getFavoritePoems() async {
    List<Map<String,dynamic>> maps = await db.query(tableName,where: '${PoemModel.isFaveText} = ?',whereArgs: [1]);
    if (maps.isNotEmpty) {
      return maps.map((e) => PoemModel.fromMap(e)).toList();
    }
    return [];
  }
}