// To parse this JSON data, do
//
//     final poemModel = poemModelFromMap(jsonString);

import 'dart:convert';

import 'package:dwawin/Models/verse_model.dart';

PoemModel poemModelFromMap(String str) => PoemModel.fromMap(json.decode(str));

String poemModelToMap(PoemModel data) => json.encode(data.toMap());

class PoemModel {

  static const String idText = "id";
  static const String nameText = "name";
  static const String diwanIdText = "diwanId";
  static const String rhymeText = "rhyme";
  static const String contentText = "content";



  PoemModel({
    this.id,
    this.diwanId,
    this.name,
    this.rhyme,
    this.content = const [],
  });

  int? id;
  int? diwanId;
  String? name;
  String? rhyme;
  int get nOfVerses => content.length;
  List<VerseModel> content;

  PoemModel copyWith({
    int? id,
    int? diwanId,
    String? name,
    String? rhyme,
    List<VerseModel>? content,
  }) =>
      PoemModel(
        id: id ?? this.id,
        diwanId: diwanId ?? this.diwanId,
        name: name ?? this.name,
        rhyme: rhyme ?? this.rhyme,
        content: content ?? this.content,
      );

  factory PoemModel.fromMap(Map<String, dynamic> jsonData) => PoemModel(
    id: jsonData[idText],
    diwanId: jsonData[diwanIdText],
    name: jsonData[nameText],
    rhyme: jsonData[rhymeText],
    content: jsonData[contentText] == null ? [] :
    jsonData[contentText].runtimeType != String?
    List<VerseModel>.from(jsonData[contentText].map((x) => VerseModel.fromMapAddPOemId(x,poemId: jsonData[idText],diwanId: jsonData[diwanIdText],)))
        :List<VerseModel>.from(json.decode(jsonData[contentText]).map((x) => VerseModel.fromMapAddPOemId(x,poemId: jsonData[idText],diwanId: jsonData[diwanIdText],))),
  );

  Map<String, dynamic> toMap() => {
    idText: id,
    diwanIdText: diwanId,
    nameText: name,
    rhymeText: rhyme,
    contentText: json.encode(List<dynamic>.from(content.map((x) => x.toMap()))),
  };
}



