import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:share_plus/share_plus.dart';

import '../commons/app_text.dart';
import '../commons/app_theme.dart';
import '../entities/article_entity.dart';

class ArticleDetailWidget extends StatelessWidget {
  const ArticleDetailWidget({
    super.key,
    required this.article,
  });

  final ArticleEntity article;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 35,
      ),
      child: Column(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: 172,
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
          const SizedBox(height: 25),
          Text(
            article.title,
            textAlign: TextAlign.center,
            style: AppTheme.titleTextStyle.copyWith(
              color: AppTheme.colorBlack.withOpacity(0.55),
              letterSpacing: 0.1,
            ),
          ),
          Html(
            data: article.content,
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: AppTheme.colorGray2,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(article.authorImage),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.authorName,
                        style: AppTheme.bodyTextStyle4.copyWith(
                          color: AppTheme.colorBlack.withOpacity(0.4),
                          letterSpacing: 0.1,
                        ),
                      ),
                      Text(
                        article.authorDescription,
                        style: AppTheme.bodyTextStyle3.copyWith(
                          color: AppTheme.colorBlack.withOpacity(0.4),
                          letterSpacing: 0.1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: 35,
            child: ElevatedButton(
              onPressed: () async {
                await Share.share(article.url);
              },
              style: const ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
                backgroundColor: MaterialStatePropertyAll(AppTheme.colorOrange4),
              ),
              child: Text(
                AppText.share.text.toUpperCase(),
                style: AppTheme.buttonTextStyle2.copyWith(
                  color: AppTheme.colorWhite,
                  letterSpacing: 1.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
