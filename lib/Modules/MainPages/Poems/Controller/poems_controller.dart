
import 'package:dwawin/Models/diwan_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../../Database/db_poem_table.dart';
import '../../../../Models/poem_model.dart';

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
    getData();
    super.initState();
  }
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
  List<PoemModel>poemsList=[];

  getData()async{
    poemsList = await PoemDbHelper().getAll();
    setState(() { });

  }

}
