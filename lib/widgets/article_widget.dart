import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../commons/app_text.dart';
import '../commons/app_theme.dart';
import '../entities/article_entity.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({
    super.key,
    required this.article,
    required this.onTap,
  });

  final ArticleEntity article;
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
              article.title.toUpperCase(),
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
              child: CachedNetworkImage(
                imageUrl: article.image,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              article.text,
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
                  await Share.share(article.url);
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
