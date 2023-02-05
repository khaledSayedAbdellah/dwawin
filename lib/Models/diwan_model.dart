// To parse this JSON data, do
//
//     final diwanModel = diwanModelFromMap(jsonString);

import 'dart:convert';

DiwanModel diwanModelFromMap(String str) => DiwanModel.fromMap(json.decode(str));

String diwanModelToMap(DiwanModel data) => json.encode(data.toMap());

class DiwanModel {
  static const String idText = "id";
  static const String nameText = "name";
  static const String descriptionText = "description";
  static const String nOfPoemsText = "nOfPoems";
  static const String collectionText = "collection";

  DiwanModel({
    this.id,
    this.name,
    this.description,
    this.nOfPoems,
    this.isCollection = 0
  });

  int? id;
  String? name;
  String? description;
  int? nOfPoems;
  int isCollection;

  factory DiwanModel.fromMap(Map<String, dynamic> json) => DiwanModel(
    id: json[idText],
    name: json[nameText],
    description: json[descriptionText],
    nOfPoems: json[nOfPoemsText],
    isCollection: json[collectionText]
  );

  Map<String, dynamic> toMap() => {
    idText: id,
    nameText: name,
    descriptionText: description,
    nOfPoemsText: nOfPoems,
    collectionText: isCollection
  };
}
