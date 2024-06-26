import 'package:dwawin/Modules/MainPages/splach_screen.dart';
import 'package:dwawin/Utilities/shared_preferances_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';
import '../../../../Control/app_languages.dart';
import '../../../../Models/drawer_model.dart';
import '../../../../Utilities/helper.dart';
import '../../../AboutApp/Screen/about_app.dart';
import '../../../ChangeLanguage/Screen/change_language.dart';
import '../../../Favorites/Screen/favorites.dart';
import '../../../Note/Screen/note.dart';
class DrawersController extends ControllerMVC {
  // singleton
  factory DrawersController(){
    _this ??= DrawersController._();
    return _this!;
  }

  static DrawersController? _this;
  DrawersController._();
int selectLanguage=0;
static List<String> supportedLanguage = ["ar", "en"];
  @override
  void initState() {
    checkStatusLang();
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }
  List<DrawerModel>drawerList=[
    DrawerModel(title: "fav",image: "ic_go_fav.svg",id: 0,routeName: Favorites.routeName),
    DrawerModel(title: "hint",image: "ic_go_comments.svg",id: 1,routeName: Note.routeName),
    DrawerModel(title: "share_app",image: "ic_share_app.svg",id: 2),
    DrawerModel(title: "lang",image: "ic_lang.svg",id: 3),
    DrawerModel(title: "connect_with_us",image: "ic_contact.svg",id: 4),
    DrawerModel(title: "about_app",image: "ic_about.svg",id: 5,routeName: AboutApp.routeName),
  ];
  checkStatusLang(){
    if(SharedPref.getCurrentLang()=="en"){
      selectLanguage=1;
      setState(() { });
    }else{
      selectLanguage=0;
      setState(() { });
    }
  }
  onTapFunction({required BuildContext context ,DrawerModel? model}){
    if(model?.id!=3&&model?.id!=2){
      Navigator.of(context).pushNamed(model?.routeName??'');
    }else if(model?.id==2){
      share();
    }
    else{
      Helper.showBottomSheetWithDynamicHeight(context: context,
          widget:ChangeLanguage(
            selectLanguage: selectLanguage,
            onChange: (i){
              selectLanguage=i;
              selectLang(context);
              setState(() { });
            },
          ));
    }
  }
  Future selectLang(BuildContext context) async {
    final appLan = Provider.of<AppLanguage>(context, listen: false);
    await appLan.changeLanguage(Locale(supportedLanguage[selectLanguage]));
    await Future.delayed(const Duration(milliseconds: 50));
    Navigator.of(context).pushNamed(SplashScreen.routeName);
  }
   share() async {
    await FlutterShare.share(
        title: 'dwawin',
        text: 'dwawin app',
        linkUrl: 'https://dwawin.com/',
        chooserTitle: 'dwawin app',
    );
  }
}
