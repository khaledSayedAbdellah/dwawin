import 'package:audioplayers/audioplayers.dart';
import 'package:dwawin/Modules/PomesShow/Widget/more_content_widget.dart';
import 'package:dwawin/Utilities/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class PoemsShowController extends ControllerMVC {
  // singleton
  factory PoemsShowController(){
    _this ??= PoemsShowController._();
    return _this!;
  }

  static PoemsShowController? _this;
  PoemsShowController._();
  bool loading = false;
  late TextEditingController searchController;
  AudioPlayer player = AudioPlayer();

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
  getDuration()async{
    await player.getDuration();
  }
playMusic()async{
  await player.getDuration();
}
  pauseMusic()async{
  await player.pause();
}
  moreOnTap({required BuildContext context})async{
   Helper.showBottomSheetWithDynamicHeight(context: context, widget: MoreContentWidget());
  }
}
