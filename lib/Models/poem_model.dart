// To parse this JSON data, do
//
//     final poemModel = poemModelFromMap(jsonString);

import 'dart:convert';

import 'package:dwawin/Models/verse_model.dart';


class PoemModel {

  static const String idText = "id";
  static const String nameText = "name";
  static const String diwanIdText = "diwanId";
  static const String rhymeText = "rhyme";
  static const String contentText = "content";
  static const String noteText = "note";
  static const String isFaveText = "is_fave";



  PoemModel({
    this.id,
    this.diwanId,
    this.name,
    this.rhyme,
    this.content = const [],
    this.notes,
    this.isFave = false
  });

  int? id;
  int? diwanId;
  String? name;
  String? rhyme;
  String? notes;
  int get nOfVerses => content.length;
  List<VerseModel> content;
  bool isFave;

  factory PoemModel.fromMap(Map<String, dynamic> jsonData) => PoemModel(
    id: jsonData[idText],
    diwanId: jsonData[diwanIdText],
    name: jsonData[nameText],
    rhyme: jsonData[rhymeText],
    notes: jsonData[noteText],
    isFave: jsonData[isFaveText] == 1?true:false,
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
    noteText: notes,
    isFaveText: isFave?1:0,
    contentText: json.encode(List<dynamic>.from(content.map((x) => x.toMap()))),
  };
}



