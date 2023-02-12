import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../Database/db_poem_table.dart';
import '../../../Models/poem_model.dart';
class FavoritesController extends ControllerMVC {
  // singleton
  factory FavoritesController(){
    _this ??= FavoritesController._();
    return _this!;
  }

  static FavoritesController? _this;
  FavoritesController._();
  bool loading = false;
  late TextEditingController searchController;
  List<PoemModel> favoritePoems=[];
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
  favoritePoems=await PoemDbHelper().getFavoritePoems();
  setState(() { });
}
}
