import 'package:dwawin/Database/db_verse_table.dart';
import 'package:dwawin/Models/verse_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../Database/db_diwan_table.dart';
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

}
