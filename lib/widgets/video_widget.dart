import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';

import '../commons/app_asset.dart';
import '../commons/app_text.dart';
import '../commons/app_theme.dart';
import '../entities/video_entity.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    super.key,
    required this.video,
    required this.onTap,
  });

  final VideoEntity video;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          left: 30,
          right: 30,
        ),
        child: Column(
          children: [
            Text(
              video.name.toUpperCase(),
              textAlign: TextAlign.center,
              style: AppTheme.titleTextStyle3.copyWith(
                color: AppTheme.colorBlack2,
                letterSpacing: 1.13,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).width / 3,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.colorBlack.withOpacity(0.13),
                    blurRadius: 2,
                    spreadRadius: 0,
                    offset: const Offset(0, 3),
                  )
                ],
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    top: 0,
                    left: 0,
                    child: CachedNetworkImage(
                      imageUrl: video.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        video.fileUrl.isEmpty ? AppAsset.playRed.path : AppAsset.playBlue.path,
                        fit: BoxFit.scaleDown,
                        width: 45,
                        height: 45,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              video.description,
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
                  await Share.share(video.awsUrl);
                },
                style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
                  backgroundColor: MaterialStatePropertyAll(AppTheme.colorGray),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.share,
                      color: AppTheme.colorBlack2,
                      size: 15,
                    ),
                    const SizedBox(width: 7),
                    Text(
                      AppText.share.text,
                      style: AppTheme.buttonTextStyle.copyWith(
                        color: AppTheme.colorBlack2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Divider(
              color: AppTheme.colorBlack2.withOpacity(0.1),
            ),
          ],
        ),
      ),
    );
  }
}
