import 'package:audioplayers/audioplayers.dart';
import 'package:dwawin/Modules/PomesShow/Widget/more_content_widget.dart';
import 'package:dwawin/Utilities/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../Database/db_poem_table.dart';
import '../../../Models/poem_model.dart';
import '../Widget/add_note_alert_widget.dart';

class PoemsShowController extends ControllerMVC {
  // singleton
  factory PoemsShowController() {
    _this ??= PoemsShowController._();
    return _this!;
  }

  static PoemsShowController? _this;

  PoemsShowController._();

  bool loading = false,isFavorite=false;
  late TextEditingController searchController, noteController;
  AudioPlayer player = AudioPlayer();
  PoemModel? poem;

  @override
  void initState() {
    searchController = TextEditingController();
    noteController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    noteController.dispose();
    super.dispose();
  }

  getPoem() async {
    poem = await PoemDbHelper().getById(id: poem?.id ?? 0);
    noteController.text=poem?.notes??"";
    isFavorite=poem?.isFave??false;
    setState(() {});
  }

  moreOnTap({required BuildContext context}) async {
    Helper.showBottomSheetWithDynamicHeight(
        context: context,
        widget: MoreContentWidget(
          isFavorite: !isFavorite,
          addNote: (ctx) async {
            await AnimatedAlertAddNote(context: ctx, controller: noteController,addNote: addNote);
            },
          addFavorite: (ctx) {
            addFavorite();
          },
          playWithOutInternet: (ctx) {},
          sharePoem: (ctx) {},
        ));
  }

  addNote(){
    if (poem?.id != null) {
      Modular.to.pop();
      PoemDbHelper().addNotes(
      poemId: poem!.id!,
      note: noteController.text,
    );
    }
    setState(() {});
  }
  addFavorite(){
    if (poem?.id != null) {
      isFavorite=!isFavorite;
       PoemDbHelper().changePoemFavorite(
        poemId: poem!.id!,
        status: isFavorite,
      );
      setState(() { });
    }

  }
}
