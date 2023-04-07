import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:share_plus/share_plus.dart';

import '../../../Database/db_poem_table.dart';
import '../../../Models/poem_model.dart';
class NoteController extends ControllerMVC {
  // singleton
  factory NoteController(){
    _this ??= NoteController._();
    return _this!;
  }

  static NoteController? _this;
  NoteController._();
  bool loading = false;
  late TextEditingController searchController;
  List<PoemModel> poemsNote=[];
List<int>stackWidth=[863,908,960];
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
getData()async{
  poemsNote=await PoemDbHelper().getPoemsNote();
  setState(() { });
}

  Future onDelete(PoemModel poemModel)async{
    await PoemDbHelper().addNotes(poemId: poemModel.id, note: null);
    poemsNote.remove(poemModel);
    setState(() { });
  }

  Future onShare(PoemModel poemModel)async{
    await Share.share(poemModel.notes??"", subject: poemModel.name??"");
  }
}
