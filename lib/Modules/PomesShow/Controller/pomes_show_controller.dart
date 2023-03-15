import 'package:audio_session/audio_session.dart';
import 'package:dwawin/Modules/PomesShow/Widget/more_content_widget.dart';
import 'package:dwawin/Utilities/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import '../../../Database/db_poem_table.dart';
import '../../../Models/poem_model.dart';
import '../Widget/add_note_alert_widget.dart';
import '../Widget/seek_bar_widget.dart';
import '../../../Models/media_model.dart';
import '../../../Api/poem_sound_api.dart';

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

  PoemModel? poem;
  late AudioPlayer player;
  List<MediaModel> media = [];
  MediaModel? selectedMedia;
  ConcatenatingAudioSource playlist = ConcatenatingAudioSource(children: []);

  Stream<PositionData> get positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          player.positionStream,
          player.bufferedPositionStream,
          player.durationStream,
              (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));

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
  Future<void> initPlayer() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {});
    try {
      await player.setAudioSource(playlist);
    } catch (e, stackTrace) {}
  }


  Future setPlayList(MediaModel selectedMedia) async{
    this.selectedMedia = selectedMedia;
    String mediaFolder = await Helper.getMediaFolderPath();

    playlist = ConcatenatingAudioSource(
      children: [
        AudioSource.uri(
          Uri.parse(selectedMedia.file?.path??selectedMedia.url??""),
          tag: MediaItem(
              id: "${selectedMedia.id}",
              album: poem?.name??"",
              title: selectedMedia.name??"",
              artUri: Uri.file("$mediaFolder/sound_banner.png")
          ),
        )
      ],
    );
    setState(() { });
    await initPlayer();
  }

  Future getMediaData()async{
    setState((){loading = true;});
    media = await PoemApi.getMediaByPoemId(poemId: poem?.id);
    initPlayer();
    for (MediaModel item in media) {
      item.file = await Helper.getAndDownloadEquitableFile(filePath: item.url);
    }
    setState((){loading = false;});
    if(media.where((element) => element.file!=null).toList().isNotEmpty){
      await setPlayList(media.where((element) => element.file!=null).toList().first);
    }
  }

  Future download(int? index)async{
    if(index == null) return;
    setState(() {loading = true;});
    media[index].file = await Helper.getAndDownloadEquitableFile(filePath: media[index].url,canDownload: true);
    await setPlayList(media[index]);
    setState(() {loading = false;});
  }

  getPoem() async {
    player = AudioPlayer();
    playlist = ConcatenatingAudioSource(children: [],);
    selectedMedia = null;
    poem = await PoemDbHelper().getById(id: poem?.id ?? 0);
    noteController.text=poem?.notes??"";
    isFavorite=poem?.isFave??false;
    setState(() {});
    await getMediaData();
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
