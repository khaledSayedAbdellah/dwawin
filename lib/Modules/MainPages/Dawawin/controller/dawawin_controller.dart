import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

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
  List<EldawawinModel>eldawainList=[
    EldawawinModel(title: "Eldawain elsat",numberOfPoems:850),
    EldawawinModel(title: "Diwan Sir Al-Qalb",numberOfPoems:850),
    EldawawinModel(title: "Diwan Nurul Haq",numberOfPoems:50),
    EldawawinModel(title: "ديوان كنز العارفين",numberOfPoems:35),
    EldawawinModel(title: "Eldawain elsat",numberOfPoems:850),
    EldawawinModel(title: "Diwan Sir Al-Qalb",numberOfPoems:850),
    EldawawinModel(title: "Diwan Nurul Haq",numberOfPoems:50),
    EldawawinModel(title: "ديوان كنز العارفين",numberOfPoems:35),
    EldawawinModel(title: "Eldawain elsat",numberOfPoems:850),
    EldawawinModel(title: "Diwan Sir Al-Qalb",numberOfPoems:850),
    EldawawinModel(title: "Diwan Nurul Haq",numberOfPoems:50),
    EldawawinModel(title: "ديوان كنز العارفين",numberOfPoems:35),
  ];
}
