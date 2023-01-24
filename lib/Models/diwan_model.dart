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

  DiwanModel({
    this.id,
    this.name,
    this.description,
    this.nOfPoems,
  });

  int? id;
  String? name;
  String? description;
  int? nOfPoems;

  DiwanModel copyWith({
    int? id,
    String? name,
    String? description,
    int? nOfPoems,
  }) =>
      DiwanModel(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        nOfPoems: nOfPoems ?? this.nOfPoems,
      );

  factory DiwanModel.fromMap(Map<String, dynamic> json) => DiwanModel(
    id: json[idText],
    name: json[nameText],
    description: json[descriptionText],
    nOfPoems: json[nOfPoemsText],
  );

  Map<String, dynamic> toMap() => {
    idText: id,
    nameText: name,
    descriptionText: description,
    nOfPoemsText: nOfPoems,
  };
}
