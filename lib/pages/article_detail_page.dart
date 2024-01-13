import 'package:flutter/material.dart';

import '../commons/app_text.dart';
import '../commons/app_theme.dart';
import '../controllers/inspiration_controller.dart';
import '../widgets/article_detail_widget.dart';

class ArticleDetailPage extends StatefulWidget {
  const ArticleDetailPage(
    this._controller, {
    super.key,
    required this.articleId,
  });

  final InspirationController _controller;
  final int articleId;

  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  @override
  void initState() {
    super.initState();
    widget._controller.loadArticleById(widget.articleId);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget._controller,
      builder: (context, child) {
        if (widget._controller.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (widget._controller.message.isNotEmpty) {
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
                  widget._controller.message,
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
                      widget._controller.loadArticleById(widget.articleId);
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
        return ArticleDetailWidget(
          article: widget._controller.article!,
        );
      },
    );
  }
}
