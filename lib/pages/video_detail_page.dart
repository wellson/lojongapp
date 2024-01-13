import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../commons/app_text.dart';
import '../commons/app_theme.dart';
import '../entities/video_entity.dart';
import '../widgets/video_detail_widget.dart';

class VideoDetailPage extends StatefulWidget {
  const VideoDetailPage({
    super.key,
    required this.video,
  });

  final VideoEntity video;

  @override
  State<VideoDetailPage> createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.networkUrl(Uri.parse(widget.video.awsUrl))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _videoController,
      builder: (context, child) {
        if (!_videoController.value.isInitialized) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (_videoController.value.hasError) {
          return Padding(
            padding: const EdgeInsets.all(80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppText.error.text.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: AppTheme.titleTextStyle3.copyWith(
                    color: AppTheme.colorBlack2,
                    letterSpacing: 1.13,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  _videoController.value.errorDescription ?? '',
                  textAlign: TextAlign.center,
                  style: AppTheme.bodyTextStyle.copyWith(
                    color: AppTheme.colorBlack2,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 123,
                  height: 27,
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).pop();
                    },
                    style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
                      backgroundColor: MaterialStatePropertyAll(AppTheme.colorGray),
                    ),
                    child: Text(
                      AppText.reload.text,
                      style: AppTheme.buttonTextStyle.copyWith(
                        color: AppTheme.colorBlack2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return VideoDetailWidget(
          videoPlayerController: _videoController,
        );
      },
    );
  }
}
