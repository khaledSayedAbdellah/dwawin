
import '../Models/diwan_model.dart';
import '../Models/poem_model.dart';
import '../Models/verse_model.dart';

class ConstDb {
  static const String dbName = "dwawin.db";

  static const String diwanTableName = "diwan";
  static const String poemTableName = "poem";
  static const String verseTableName = "verse";


  static String createDiwanTable =
  """CREATE TABLE IF NOT EXISTS $diwanTableName (${DiwanModel.idText} INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  ${DiwanModel.nameText} TEXT, 
  ${DiwanModel.descriptionText} TEXT, 
  ${DiwanModel.nOfPoemsText} INTEGER,
  ${DiwanModel.collectionText} INTEGER)""";


  static String createPoemTable =
  """CREATE TABLE IF NOT EXISTS $poemTableName (${PoemModel.idText} INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  ${PoemModel.diwanIdText} INTEGER, 
  ${PoemModel.nameText} TEXT, 
  ${PoemModel.rhymeText} TEXT, 
  ${PoemModel.contentText} TEXT)""";

  static String createVerseTable =
  """CREATE TABLE IF NOT EXISTS $verseTableName (${VerseModel.idText} INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  ${VerseModel.poemIdText} INTEGER, 
  ${VerseModel.diwanIdText} INTEGER, 
  ${VerseModel.verse1Text} TEXT, 
  ${VerseModel.verse2Text} TEXT, 
  ${VerseModel.verse1RmText} TEXT, 
  ${VerseModel.verse2RmText} TEXT)""";
}
