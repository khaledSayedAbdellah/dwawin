
import 'package:dwawin/Database/db_diwan_table.dart';
import 'package:dwawin/Database/db_poem_table.dart';
import 'package:dwawin/Models/diwan_model.dart';
import 'package:dwawin/Models/poem_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class HomeController extends ControllerMVC {
  // singleton
  factory HomeController(){
    _this ??= HomeController._();
    return _this!;
  }

  static HomeController? _this;
  HomeController._();
late TextEditingController searchController;
  bool loading = false;
  List<DiwanModel> eldawainList = [];
  List<PoemModel>poemsList=[];
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
eldawainList = await DiwanDbHelper().getAll();
poemsList=await PoemDbHelper().getAll();
setState(() { });
}



}