import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoDetailWidget extends StatelessWidget {
  const VideoDetailWidget({
    super.key,
    required this.videoPlayerController,
  });

  final VideoPlayerController videoPlayerController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 35,
      ),
      child: VideoPlayer(videoPlayerController),
    );
  }
}
