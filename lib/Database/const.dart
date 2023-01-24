import 'package:dwawin/Models/poem_model.dart';
import 'package:dwawin/Models/diwan_model.dart';

class ConstDb {
  static const String dbName = "dwawin.db";

  static const String diwanTableName = "diwan";
  static const String poemTableName = "poem";


  static String createDiwanTable =
  """CREATE TABLE IF NOT EXISTS $diwanTableName (${DiwanModel.idText} INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  ${DiwanModel.nameText} TEXT, 
  ${DiwanModel.descriptionText} TEXT, 
  ${DiwanModel.nOfPoemsText} INTEGER)""";

  static String createPoemTable =
  """CREATE TABLE IF NOT EXISTS $poemTableName (${PoemModel.idText} INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  ${PoemModel.diwanIdText} INTEGER, 
  ${PoemModel.nameText} TEXT, 
  ${PoemModel.rhymeText} TEXT, 
  ${PoemModel.contentText} TEXT)""";
}
