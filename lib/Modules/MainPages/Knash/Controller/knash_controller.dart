
import 'package:dwawin/Database/db_diwan_table.dart';
import 'package:dwawin/Models/diwan_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';


class KnashController extends ControllerMVC {
  // singleton
  factory KnashController(){
    _this ??= KnashController._();
    return _this!;
  }

  static KnashController? _this;
  KnashController._();
  late TextEditingController searchController;
  bool loading = false;

  @override
  void initState() {
    searchController=TextEditingController();
    searchController.addListener(() { });
    getData();
    super.initState();
  }
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
  List<DiwanModel> knashDwawin = [];

  getData()async{
    knashDwawin = await DiwanDbHelper().getAllKnash();
    setState(() { });

  }

}
