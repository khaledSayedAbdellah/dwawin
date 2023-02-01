import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../Database/db_diwan_table.dart';
import '../../../Models/eldawawin_model.dart';
import '../../../Models/poem_model.dart';
class DiwanShowController extends ControllerMVC {
  // singleton
  factory DiwanShowController(){
    _this ??= DiwanShowController._();
    return _this!;
  }

  static DiwanShowController? _this;
  DiwanShowController._();
  bool loading = false;
  late TextEditingController searchController;
  List<PoemModel> getPoemsByDiwanId=[];
  List<String> getRhymeByDiwanId=[];
  int? diwanId;
  @override
  void initState() {
    searchController=TextEditingController();
    searchController.addListener(() { });
    init();
    super.initState();
  }
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
  init()async{
    getPoemsByDiwanId=await  DiwanDbHelper().getPoemsByDiwanId(id: diwanId);
    getRhymeByDiwanId=await  DiwanDbHelper().getRhymeByDiwanId(id: diwanId??0);
    setState(() { });
  }
  List<EldawawinModel>poemsList=[
    EldawawinModel(title: "قصيدة بسملة",firstVerse: "بسم الإله أشكر المريدا",secondVerse: " وأرتجي بفضله المزيدا"),
    EldawawinModel(title: "قصيدة وكفاني",firstVerse: "بسم الإله أشكر المريدا",secondVerse: " وأرتجي بفضله المزيدا"),
    EldawawinModel(title: "قصيدة العينية",firstVerse: "بسم الإله أشكر المريدا",secondVerse: " وأرتجي بفضله المزيدا"),
    EldawawinModel(title: "قصيدة مديح نبوي",firstVerse: "ملى القلب حب الهاشمي فلم أنم ",secondVerse: "بباريس حولي الراقدون ولم أُلم"),
    EldawawinModel(title: "قصيدة أبرق بدا",firstVerse: "بسم الإله أشكر المريدا",secondVerse: " وأرتجي بفضله المزيدا"),
  ];
  List<EldawawinModel>elquafi=[
    EldawawinModel(title: "ب"),
    EldawawinModel(title: "ل"),
    EldawawinModel(title: "ا"),
    EldawawinModel(title: "ا"),
    EldawawinModel(title: "ت"),
    EldawawinModel(title: "ن"),
    EldawawinModel(title: "م"),
    EldawawinModel(title: "ب"),
    EldawawinModel(title: "ل"),
    EldawawinModel(title: "ا"),
    EldawawinModel(title: "ا"),
    EldawawinModel(title: "ت"),
    EldawawinModel(title: "ن"),
    EldawawinModel(title: "م"),
  ];

}
