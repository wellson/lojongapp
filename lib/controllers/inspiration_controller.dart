import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../commons/app_text.dart';
import '../entities/article_entity.dart';
import '../entities/article_list_entity.dart';
import '../entities/quote_list_entity.dart';
import '../entities/video_entity.dart';
import '../repositories/inspiration_repository.dart';

final class InspirationController extends ChangeNotifier {
  InspirationController(
    this._repository,
  );

  final InspirationRepository _repository;

  ArticleListEntity? articles;
  ArticleEntity? article;
  QuoteListEntity? quotes;
  List<VideoEntity>? videos;

  bool loading = false;
  String message = '';

  void loadAllArticles(int page) async {
    loading = true;
    try {
      bool hasConnection = await InternetConnectionChecker().hasConnection;
      if (!hasConnection) throw AppText.noConnection.text;
      final data = await _repository.getAllArticles(page);
      if (articles != null && data != null) {
        final oldList = articles?.articles ?? [];
        final newList = data.articles;
        articles = ArticleListEntity(
          hasMore: data.hasMore,
          currentPage: data.currentPage,
          lastPage: data.nextPage,
          nextPage: data.nextPage,
          articles: [...oldList, ...newList],
        );
      } else {
        articles = data;
      }
    } catch (e) {
      message = e.toString();
    }
    loading = false;
    notifyListeners();
  }

  void loadArticleById(int articleId) async {
    loading = true;
    try {
      bool hasConnection = await InternetConnectionChecker().hasConnection;
      if (!hasConnection) throw AppText.noConnection.text;
      article = await _repository.getArticleById(articleId);
    } catch (e) {
      message = e.toString();
    }
    loading = false;
    notifyListeners();
  }

  void loadAllQuotes(int page) async {
    loading = true;
    try {
      bool hasConnection = await InternetConnectionChecker().hasConnection;
      if (!hasConnection) throw AppText.noConnection.text;
      final data = await _repository.getAllQuotes(page);
      if (quotes != null && data != null) {
        final oldList = quotes?.quotes ?? [];
        final newList = data.quotes;
        quotes = QuoteListEntity(
          hasMore: data.hasMore,
          currentPage: data.currentPage,
          lastPage: data.nextPage,
          nextPage: data.nextPage,
          quotes: [...oldList, ...newList],
        );
      } else {
        quotes = data;
      }
    } catch (e) {
      message = e.toString();
    }
    loading = false;
    notifyListeners();
  }

  void loadAllVideos(int page) async {
    loading = true;
    try {
      bool hasConnection = await InternetConnectionChecker().hasConnection;
      if (!hasConnection) throw AppText.noConnection.text;
      videos = await _repository.getAllVideos(page);
    } catch (e) {
      message = e.toString();
    }
    loading = false;
    notifyListeners();
  }
}
