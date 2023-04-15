// To parse this JSON data, do
//
//     final shikhDataModel = shikhDataModelFromMap(jsonString);

import 'dart:convert';

import 'package:dwawin/Utilities/shared_preferances_helper.dart';

ShikhDataModel shikhDataModelFromMap(String str) => ShikhDataModel.fromMap(json.decode(str));

String shikhDataModelToMap(ShikhDataModel data) => json.encode(data.toMap());

class ShikhDataModel {


  String? get dateOfBirth => SharedPref.getCurrentLang() != "en"? dateOfBirthAndGrowing:dateOfBirthAndGrowingEn;
  String? get elders => SharedPref.getCurrentLang() != "en"? hisElders:hisEldersEn;
  String? get ijazaat => SharedPref.getCurrentLang() != "en"? ijazaatScholar:ijazaatScholarEn;




  ShikhDataModel({
    this.dateOfBirthAndGrowing,
    this.hisElders,
    this.ijazaatScholar,
    this.dateOfBirthAndGrowingEn,
    this.hisEldersEn,
    this.ijazaatScholarEn,
  });

  String? dateOfBirthAndGrowing;
  String? hisElders;
  String? ijazaatScholar;
  String? dateOfBirthAndGrowingEn;
  String? hisEldersEn;
  String? ijazaatScholarEn;

  factory ShikhDataModel.fromMap(Map<String, dynamic> json) => ShikhDataModel(
    dateOfBirthAndGrowing: json["dateOfBirth_and_growing"],
    hisElders: json["hisـelders"],
    ijazaatScholar: json["ijazaatـscholar"],
    dateOfBirthAndGrowingEn: json["dateOfBirth_and_growing_en"],
    hisEldersEn: json["hisـelders_en"],
    ijazaatScholarEn: json["ijazaatـscholar_en"],
  );

  Map<String, dynamic> toMap() => {
    "dateOfBirth_and_growing": dateOfBirthAndGrowing,
    "hisـelders": hisElders,
    "ijazaatـscholar": ijazaatScholar,
    "dateOfBirth_and_growing_en": dateOfBirthAndGrowingEn,
    "hisـelders_en": hisEldersEn,
    "ijazaatـscholar_en": ijazaatScholarEn,
  };
}
