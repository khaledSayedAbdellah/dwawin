// To parse this JSON data, do
//
//     final mediaModel = mediaModelFromMap(jsonString);

import 'dart:convert';
import 'dart:io';

class MediaModel {
  MediaModel({
    this.id,
    this.name,
    this.url,
    this.file
  });

  int? id;
  String? name;
  String? url;
  File? file;

  factory MediaModel.fromMap(Map<String, dynamic> json) => MediaModel(
    id: json["id"],
    name: json["name"],
    url: json["url"],
  );
}
