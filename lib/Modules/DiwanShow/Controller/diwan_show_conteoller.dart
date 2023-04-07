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
  List<PoemModel> _diwanPoems=[];
  List<PoemModel> get poemsWithRhyme=> _diwanPoems.where((element) => (element.rhyme == selectedRhyme) || selectedRhyme == null).toList();
  int? diwanId;
  String? selectedRhyme;

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
    _diwanPoems = await  DiwanDbHelper().getPoemsByDiwanId(id: diwanId);
    setState(() { });
  }

}
