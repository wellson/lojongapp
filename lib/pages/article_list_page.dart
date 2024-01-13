import 'package:flutter/material.dart';
import 'package:refresh_loadmore/refresh_loadmore.dart';

import '../commons/app_text.dart';
import '../commons/app_theme.dart';
import '../controllers/inspiration_controller.dart';
import '../widgets/article_widget.dart';
import 'article_detail_page.dart';

class ArticleListPage extends StatefulWidget {
  const ArticleListPage(
    this._controller, {
    super.key,
  });

  final InspirationController _controller;

  @override
  State<ArticleListPage> createState() => _ArticleListPageState();
}

class _ArticleListPageState extends State<ArticleListPage> {
  @override
  void initState() {
    super.initState();
    widget._controller.loadAllArticles(1);
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
                      widget._controller.loadAllArticles(1);
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
        final list = widget._controller.articles!;
        return RefreshLoadmore(
          onRefresh: () async {
            widget._controller.loadAllArticles(1);
          },
          onLoadmore: () async {
            widget._controller.loadAllArticles(list.nextPage);
          },
          isLastPage: list.currentPage >= list.lastPage,
          noMoreWidget: Text(
            AppText.noMoreData.text,
            style: AppTheme.titleTextStyle6.copyWith(
              color: AppTheme.colorOrange4,
            ),
          ),
          child: Builder(
            builder: (context) {
              return Column(
                children: list.articles.map(
                  (e) {
                    return ArticleWidget(
                      article: e,
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return ArticleDetailPage(
                              widget._controller,
                              articleId: e.id,
                            );
                          },
                        );
                      },
                    );
                  },
                ).toList(),
              );
            },
          ),
        );
      },
    );
  }
}
