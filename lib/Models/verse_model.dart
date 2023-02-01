
import 'package:dwawin/Utilities/helper.dart';

class VerseModel {

  static const String idText = "id";
  static const String poemIdText = "poem_id";
  static const String diwanIdText = "diwan_id";
  static const String verse1Text = "verse1";
  static const String verse2Text = "verse2";
  static const String verse1RmText = "verse1Rm";
  static const String verse2RmText = "verse2Rm";

  VerseModel({
    this.id,
    this.poemId,
    this.diwanId,
    this.verse1,
    this.verse2,
    this.verse1Rm,
    this.verse2Rm
  });

  int? id,poemId,diwanId;
  String? verse1,verse2;
  String? verse1Rm,verse2Rm;

  factory VerseModel.fromMapAddPOemId(Map<String, dynamic> json, {int? poemId,int? diwanId}) => VerseModel(
    id: json[idText],
    poemId: poemId,
    diwanId: diwanId,
    verse1: json[verse1Text],
    verse2: json[verse2Text],
    verse1Rm: json[verse1Text]?.toString().rmArFormation(),
    verse2Rm: json[verse2Text]?.toString().rmArFormation(),
  );

  factory VerseModel.fromMap(Map<String, dynamic> json) => VerseModel(
    id: json[idText],
    poemId: json[poemIdText],
    diwanId: json[diwanIdText],
    verse1: json[verse1Text],
    verse2: json[verse2Text],
    verse1Rm: json[verse1RmText],
    verse2Rm: json[verse2RmText],
  );

  Map<String, dynamic> toMap() => {
    idText: id,
    poemIdText: poemId,
    diwanIdText: diwanId,
    verse1Text: verse1,
    verse2Text: verse2,
    verse1RmText: verse1Rm,
    verse2RmText: verse2Rm,
  };
}