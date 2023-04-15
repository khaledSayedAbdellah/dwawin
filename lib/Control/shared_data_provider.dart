import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class SharedDataProvider with ChangeNotifier, DiagnosticableTreeMixin {
  int _appVersion = 0;

  int get appVersion => _appVersion;
  int _currentNavIndex = 0;
  double _fontSize=40;
  Color _fontColor=const Color(0xff000000);
  Color _backGroundColor=const Color(0xffffFCEE);
  Color get fontColor=>_fontColor;
  Color get backGroundColor=>_backGroundColor;

double get fontSize=>_fontSize;
  int get currentNavIndex => _currentNavIndex;


setFontColor({required Color newFontColor}){
  _fontColor=newFontColor;
  notifyListeners();
}
setBackGroundColor({required Color newBackGroundColor}){
  _backGroundColor=newBackGroundColor;
  notifyListeners();
}
  Future getData() async {
    await Future.delayed(const Duration(seconds: 3));
    _appVersion = 10;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('appVersion', appVersion));
  }

  Future setCurrentNavIndex(int i) async {
    _currentNavIndex = i;
    notifyListeners();
  }
  increaseFontSize(){
    _fontSize++;
    notifyListeners();
  }

  decreaseFontSize(){
    if(fontSize>=40){
      _fontSize--;
      notifyListeners();
    }
  }
  setDefaultFontSize(){
    _fontSize=40;
    notifyListeners();
  }
}
