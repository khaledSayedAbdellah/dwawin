import 'package:dwawin/Models/media_model.dart';
import 'package:sqflite/sqflite.dart';
import 'const.dart';
import 'database_helper.dart';

class MediaDbHelper{
  // singleton
  factory MediaDbHelper(){
    _this ??= MediaDbHelper._();
    return _this!;
  }
  static MediaDbHelper? _this;
  MediaDbHelper._();

  final db = DataBaseHelper().db;

  static String tableName = ConstDb.mediaTableName;

  Future<int> insert({required MediaModel media}) async {
    return await db.insert(tableName, media.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
  Future<int> update({required MediaModel media}) async {
    return await db.update(tableName, media.toMap(),
      where: '${MediaModel.idText} = ?', whereArgs: [media.id],
    );
  }
  Future<int> delete({required int id}) async {
    return await db.delete(tableName,
      where: '${MediaModel.idText} = ?', whereArgs: [id],);
  }

  Future<MediaModel?> getById({required int id}) async {
    List<Map<String,dynamic>> maps = await db.query(tableName,where: '${MediaModel.idText} = ?',whereArgs: [id]);
    if (maps.isNotEmpty) {
      return MediaModel.fromMap(maps.first);
    }
    return null;
  }

  Future<List<MediaModel>> getByPoemId({required int? poemId}) async {
    List<Map<String,dynamic>> maps = await db.query(tableName,where: '${MediaModel.poemIdText} = ?',whereArgs: [poemId]);
    if (maps.isNotEmpty) {
      return maps.map((e) => MediaModel.fromMap(e)).toList();
    }
    return [];
  }

  Future<List<MediaModel>> getAll() async {
    List<Map<String,dynamic>> maps = await db.query(tableName);
    if (maps.isNotEmpty) {
      return maps.map((e) => MediaModel.fromMap(e)).toList();
    }
    return [];
  }

  Future<bool> deleteAll() async {
    int result = await db.rawDelete("delete from $tableName");
    return result!=-1;
  }
}