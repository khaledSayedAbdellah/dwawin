import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:just_audio/just_audio.dart';

import '../../../Utilities/theme_helper.dart';
import '../../../generated/assets.dart';
class ControlButtons extends StatelessWidget {
  final AudioPlayer player;
  final bool canPlay,isDownloaded;
  final Function(int?) downloadOnTap;
  const ControlButtons( {Key? key, required this.player,required this.downloadOnTap, this.canPlay = false,
    this.isDownloaded = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if(!canPlay) SizedBox(),
            if(canPlay) GestureDetector(
            onTap: ()=> player.setLoopMode(LoopMode.one),
            child: SvgPicture.asset(
              Assets.imagesRepeatIcon,
              width: 95.w,
              height: 95.w,
            ),
          ),
          if(canPlay) Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // StreamBuilder<PlayerState>(
              //     stream: player.playerStateStream,
              //     builder: (context, snapshot) {
              //       return GestureDetector(
              //         onTap: ()=>player.seek(Duration(seconds: 5)),
              //         child: SvgPicture.asset(
              //           Assets.imagesSeekSupplyIcon,
              //           width: 95.w,
              //           height: 95.w,
              //         ),
              //       );
              //     }),
              SizedBox(width: 32.w),
              StreamBuilder<SequenceState?>(
                  stream: player.sequenceStateStream,
                  builder: (context, snapshot) => GestureDetector(
                    onTap: ()=> player.seek(Duration.zero),
                    child: SvgPicture.asset(
                      Assets.imagesNextIcon,
                      width: 95.w,
                      height: 95.w,
                    ),
                  )),
              SizedBox(width: 32.w),
              StreamBuilder<PlayerState>(
                stream: player.playerStateStream,
                builder: (context, snapshot) {
                  final playerState = snapshot.data;
                  final processingState = playerState?.processingState;
                  final playing = playerState?.playing;
                  if (processingState == ProcessingState.loading ||
                      processingState == ProcessingState.buffering) {
                    return Container(
                      margin: const EdgeInsets.all(8.0),
                      width: 64.w,
                      height: 64.w,
                      child: CircularProgressIndicator(
                          color: ThemeClass.primaryColor),
                    );
                  } else if (playing != true) {
                    return IconButton(
                      icon: Icon(
                        Icons.play_circle_outline,
                        size: 95.w,
                        color: Colors.white,
                      ),
                      iconSize: 64.0,
                      onPressed: player.play,
                    );
                  } else {
                    return IconButton(
                      icon: Icon(
                        Icons.pause_circle_outline,
                        size: 95.w,
                        color: Colors.white,
                      ),
                      iconSize: 64.0,
                      onPressed: player.pause,
                    );
                  }
                },
              ),
              SizedBox(width: 32.w),
              // StreamBuilder<SequenceState?>(
              //     stream: player.sequenceStateStream,
              //     builder: (context, snapshot) => GestureDetector(
              //       onTap:
              //       player.hasPrevious ? player.seekToPrevious : null,
              //       child: SvgPicture.asset(
              //         Assets.imagesPreviousIcon,
              //         width: 95.w,
              //         height: 95.w,
              //       ),
              //     )),
              // SizedBox(width: 32.w),
              // SvgPicture.asset(
              //   Assets.imagesSeekDelayIcon,
              //   width: 95.w,
              //   height: 95.w,
              // ),
            ],
          ),
          if(!isDownloaded) GestureDetector(
            onTap: () => downloadOnTap(player.currentIndex),
            child: SvgPicture.asset(
              Assets.imagesDownlodIcon,
              width: 95.w,
              height: 95.w,
            ),
          ),
          if(isDownloaded) SizedBox(),
        ],
      ),
    );
  }
}