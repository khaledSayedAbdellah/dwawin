import 'dart:developer';

import 'package:dwawin/Models/diwan_model.dart';
import 'package:sqflite/sqflite.dart';
import '../Models/poem_model.dart';
import '../Models/verse_model.dart';
import 'const.dart';
import 'database_helper.dart';

class VerseDbHelper{
  // singleton
  factory VerseDbHelper(){
    _this ??= VerseDbHelper._();
    return _this!;
  }
  static VerseDbHelper? _this;
  VerseDbHelper._();

  final db = DataBaseHelper().db;

  static String tableName = ConstDb.verseTableName;

  Future<int> insert({required VerseModel verse}) async {
    return await db.insert(tableName, verse.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
  Future<int> update({required VerseModel verse}) async {
    return await db.update(tableName, verse.toMap(),
      where: '${VerseModel.idText} = ?', whereArgs: [verse.id],
    );
  }
  Future<int> delete({required int id}) async {
    return await db.delete(tableName,
      where: '${VerseModel.idText} = ?', whereArgs: [id],);
  }

  Future<VerseModel?> getById({required int id}) async {
    List<Map<String,dynamic>> maps = await db.query(tableName,where: '${VerseModel.idText} = ?',whereArgs: [id]);
    if (maps.isNotEmpty) {
      return VerseModel.fromMap(maps.first);
    }
    return null;
  }
  Future<List<VerseModel>> searchByVerse({required String text}) async {
    List<Map<String,dynamic>> maps = await db.rawQuery(
        'SELECT p.*,c.${DiwanModel.nameText} as ${VerseModel.diwanNameText} FROM ${ConstDb.verseTableName} p LEFT JOIN ${ConstDb.diwanTableName} c ON p.${VerseModel.diwanIdText} = c.${DiwanModel.idText} WHERE (${VerseModel.verse1RmText} like ? OR ${VerseModel.verse2RmText} LIKE ? )',
        ["%$text%", "%$text%"]
    );
    if (maps.isNotEmpty) {
      return List.from(maps.map((e)=> VerseModel.fromMap(e)));
    }
    return [];
  }

  Future<List<VerseModel>> searchByVerseWithDiwanId({required String text,required int diwanId}) async {
    List<Map<String,dynamic>> maps = await db.rawQuery(
        'SELECT p.*,c.${DiwanModel.nameText} as ${VerseModel.diwanNameText} FROM ${ConstDb.verseTableName} p LEFT JOIN ${ConstDb.diwanTableName} c ON p.${VerseModel.diwanIdText} = c.${DiwanModel.idText} WHERE (${VerseModel.verse1RmText} like ? OR ${VerseModel.verse2RmText} LIKE ? ) AND p.${VerseModel.diwanIdText} = ? ',
        ["%$text%", "%$text%",diwanId]
    );
    log(maps.toString());
    if (maps.isNotEmpty) {
      return List.from(maps.map((e)=> VerseModel.fromMap(e)));
    }
    return [];
  }

  Future<List<VerseModel>> searchByVerseWithPoemId({required String text,required int poemId}) async {
    List<Map<String,dynamic>> maps = await db.rawQuery(
        'SELECT p.*,c.${PoemModel.nameText} as ${VerseModel.poemNameText} FROM ${ConstDb.verseTableName} p LEFT JOIN ${ConstDb.poemTableName} c ON p.${VerseModel.poemIdText} = c.${PoemModel.idText} WHERE (${VerseModel.verse1RmText} like ? OR ${VerseModel.verse2RmText} LIKE ? ) AND p.${VerseModel.poemIdText} = ? ',
        ["%$text%", "%$text%",poemId]
    );
    if (maps.isNotEmpty) {
      return List.from(maps.map((e)=> VerseModel.fromMap(e)));
    }
    return [];
  }

  Future<List<VerseModel>> getAll() async {
    List<Map<String,dynamic>> maps = await db.query(tableName);
    if (maps.isNotEmpty) {
      return maps.map((e) => VerseModel.fromMap(e)).toList();
    }
    return [];
  }

  Future<bool> deleteAll() async {
    int result = await db.rawDelete("delete from $tableName");
    return result!=-1;
  }
}