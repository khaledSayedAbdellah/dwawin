// To parse this JSON data, do
//
//     final poemModel = poemModelFromMap(jsonString);

import 'dart:convert';

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
  List<Content> content;

  PoemModel copyWith({
    int? id,
    int? diwanId,
    String? name,
    String? rhyme,
    List<Content>? content,
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
    List<Content>.from(jsonData[contentText].map((x) => Content.fromMap(x)))
        :List<Content>.from(json.decode(jsonData[contentText]).map((x) => Content.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    idText: id,
    diwanIdText: diwanId,
    nameText: name,
    rhymeText: rhyme,
    contentText: json.encode(List<dynamic>.from(content.map((x) => x.toMap()))),
  };
}



class Content {
  Content({
    this.verse1,
    this.verse2,
  });

  String? verse1;
  String? verse2;

  factory Content.fromMap(Map<String, dynamic> json) => Content(
    verse1: json["verse1"],
    verse2: json["verse2"],
  );

  Map<String, dynamic> toMap() => {
    "verse1": verse1,
    "verse2": verse2,
  };
}