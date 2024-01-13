import 'package:flutter/material.dart';

import '../commons/app_text.dart';
import '../commons/app_theme.dart';
import '../controllers/inspiration_controller.dart';
import '../widgets/scaffold_widget.dart';
import 'article_list_page.dart';
import 'quote_list_page.dart';
import 'video_list_page.dart';

class InspirationPage extends StatefulWidget {
  const InspirationPage(
    this._controller, {
    super.key,
  });

  final InspirationController _controller;

  @override
  State<InspirationPage> createState() => _InspirationsPageState();
}

class _InspirationsPageState extends State<InspirationPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBarTitle: AppText.inspirations.text.toUpperCase(),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Column(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              margin: const EdgeInsets.symmetric(
                vertical: 0.0,
                horizontal: 10.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppTheme.colorBlack.withOpacity(0.11),
              ),
              child: TabBar(
                padding: const EdgeInsets.all(3),
                labelColor: AppTheme.colorOrange3,
                labelPadding: const EdgeInsets.symmetric(
                  vertical: 7,
                ),
                unselectedLabelColor: AppTheme.colorWhite,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: AppTheme.colorWhite,
                  borderRadius: BorderRadius.circular(20),
                ),
                dividerHeight: 0,
                controller: _tabController,
                tabs: [
                  Text(
                    AppText.videos.text.toUpperCase(),
                    style: AppTheme.titleTextStyle5,
                  ),
                  Text(
                    AppText.articles.text.toUpperCase(),
                    style: AppTheme.titleTextStyle5,
                  ),
                  Text(
                    AppText.quotes.text.toUpperCase(),
                    style: AppTheme.titleTextStyle5,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                decoration: const BoxDecoration(
                  color: AppTheme.colorWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    VideoListPage(widget._controller),
                    ArticleListPage(widget._controller),
                    QuoteListPage(widget._controller),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
