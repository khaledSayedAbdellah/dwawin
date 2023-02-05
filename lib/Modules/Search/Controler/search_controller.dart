import 'package:dwawin/Database/db_verse_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../Models/verse_model.dart';
class SearchScreenController extends ControllerMVC {
  // singleton
  factory SearchScreenController(){
    _this ??= SearchScreenController._();
    return _this!;
  }

  static SearchScreenController? _this;
  SearchScreenController._();
  bool loading = false;
  bool? isDiwan;
  int? id;
  late TextEditingController searchController;
  List<VerseModel> searchList = [];
  @override
  void dispose() {
    isDiwan=null;
    id=null;
    searchController.dispose();
    super.dispose();
  }


  getData()async{
    loading=true;
    setState(() { });
    if(isDiwan==true){
      searchList = await VerseDbHelper().searchByVerseWithDiwanId(text: searchController.text,diwanId: id??0);
      setState(() {loading=false;});
    }else if(isDiwan==false){
      searchList = await VerseDbHelper().searchByVerseWithPoemId(text: searchController.text, poemId: id??0);
      setState(() {loading=false;});
    }else{
      searchList = await VerseDbHelper().searchByVerse(text: searchController.text,);
      setState(() { loading=false;});
    }

  }

}
