
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../../Models/eldawawin_model.dart';
class PoemsController extends ControllerMVC {
  // singleton
  factory PoemsController(){
    _this ??= PoemsController._();
    return _this!;
  }

  static PoemsController? _this;
  PoemsController._();
  late TextEditingController searchController;
  bool loading = false;

  @override
  void initState() {
    searchController=TextEditingController();
    searchController.addListener(() { });
    super.initState();
  }
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
  List<EldawawinModel>poemsList=[
    EldawawinModel(title: "قصيدة بسملة",firstVerse: "بسم الإله أشكر المريدا",secondVerse: " وأرتجي بفضله المزيدا"),
    EldawawinModel(title: "قصيدة وكفاني",firstVerse: "بسم الإله أشكر المريدا",secondVerse: " وأرتجي بفضله المزيدا"),
    EldawawinModel(title: "قصيدة العينية",firstVerse: "بسم الإله أشكر المريدا",secondVerse: " وأرتجي بفضله المزيدا"),
    EldawawinModel(title: "قصيدة مديح نبوي",firstVerse: "ملى القلب حب الهاشمي فلم أنم ",secondVerse: "بباريس حولي الراقدون ولم أُلم"),
    EldawawinModel(title: "قصيدة أبرق بدا",firstVerse: "بسم الإله أشكر المريدا",secondVerse: " وأرتجي بفضله المزيدا"),    EldawawinModel(title: "قصيدة بسملة",firstVerse: "بسم الإله أشكر المريدا",secondVerse: " وأرتجي بفضله المزيدا"),
    EldawawinModel(title: "قصيدة وكفاني",firstVerse: "بسم الإله أشكر المريدا",secondVerse: " وأرتجي بفضله المزيدا"),
    EldawawinModel(title: "قصيدة العينية",firstVerse: "بسم الإله أشكر المريدا",secondVerse: " وأرتجي بفضله المزيدا"),
    EldawawinModel(title: "قصيدة مديح نبوي",firstVerse: "ملى القلب حب الهاشمي فلم أنم ",secondVerse: "بباريس حولي الراقدون ولم أُلم"),
    EldawawinModel(title: "قصيدة أبرق بدا",firstVerse: "بسم الإله أشكر المريدا",secondVerse: " وأرتجي بفضله المزيدا"),
  ];
}
