import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../../Models/shikh_data_model.dart';
import '../../../../Utilities/initial_local_data.dart';
class AboutUsController extends ControllerMVC {
  // singleton
  factory AboutUsController(){
    _this ??= AboutUsController._();
    return _this!;
  }

  static AboutUsController? _this;
  AboutUsController._();
  bool loading = false;
  late TextEditingController searchController;

  ShikhDataModel? shikhDataModel;

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

  getData() async{
    shikhDataModel = await InitialLocalData.getShikhData();
    setState(() { });
  }
}
