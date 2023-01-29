import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
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
