
import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
class SearchScreenController extends ControllerMVC {
  // singleton
  factory SearchScreenController(){
    _this ??= SearchScreenController._();
    return _this!;
  }

  static SearchScreenController? _this;
  SearchScreenController._();
  bool loading = false;
  late TextEditingController searchController;
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }


}
