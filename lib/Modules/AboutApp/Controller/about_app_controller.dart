import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
class AboutAppController extends ControllerMVC {
  // singleton
  factory AboutAppController(){
    _this ??= AboutAppController._();
    return _this!;
  }

  static AboutAppController? _this;
  AboutAppController._();
  bool loading = false;
  late TextEditingController searchController;
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
