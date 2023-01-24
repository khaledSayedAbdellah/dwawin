import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
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

}
