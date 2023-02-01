import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../../Database/db_diwan_table.dart';
import '../../../../Models/diwan_model.dart';
import '../../../../Models/eldawawin_model.dart';
class DawawinController extends ControllerMVC {
  // singleton
  factory DawawinController(){
    _this ??= DawawinController._();
    return _this!;
  }

  static DawawinController? _this;
  DawawinController._();
  bool loading = false;
  late TextEditingController searchController;
  List<DiwanModel> eldawainList = [];
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
    setState(() { });
  }

}
