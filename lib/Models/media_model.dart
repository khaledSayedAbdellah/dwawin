import 'dart:io';

class MediaModel {

  static const String idText = "id";
  static const String nameText = "name";
  static const String urlText = "url";
  static const String poemIdText = "subCategoryId";

  MediaModel({
    this.id,
    this.name,
    this.url,
    this.file,
    this.poemId
  });

  int? id;
  int? poemId;
  String? name;
  String? url;
  File? file;

  factory MediaModel.fromMap(Map<String, dynamic> json) => MediaModel(
    id: json[idText],
    poemId: json[poemIdText],
    name: json[nameText],
    url: json[urlText],
  );

  Map<String, dynamic> toMap() => {
    idText: id,
    poemIdText: poemId,
    nameText: name,
    urlText: url,
  };
}
