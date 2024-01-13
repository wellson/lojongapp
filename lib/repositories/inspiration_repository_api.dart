import 'package:dio/dio.dart';

import '../entities/article_entity.dart';
import '../entities/article_list_entity.dart';
import '../entities/quote_list_entity.dart';
import '../entities/video_entity.dart';
import '../models/article_list_model.dart';
import '../models/article_model.dart';
import '../models/quote_list_model.dart';
import '../models/video_model.dart';
import 'inspiration_repository.dart';

final class InspirationRepositoryApi implements InspirationRepository {
  const InspirationRepositoryApi(
    this._dio,
  );

  final Dio _dio;

  @override
  Future<ArticleListEntity?> getAllArticles(int page) async {
    final response = await _dio.get(
      '/articles2',
      queryParameters: {
        'page': page,
      },
    );
    final data = Map<String, dynamic>.from(response.data ?? {});
    if (data.isEmpty) return null;
    return ArticleListModel.fromMap(data).toEntity();
  }

  @override
  Future<ArticleEntity?> getArticleById(int articleId) async {
    final response = await _dio.get(
      '/article-content',
      queryParameters: {
        'articleid': articleId,
      },
    );
    final data = Map<String, dynamic>.from(response.data ?? {});
    if (data.isEmpty) return null;
    return ArticleModel.fromMap(data).toEntity();
  }

  @override
  Future<QuoteListEntity?> getAllQuotes(int page) async {
    final response = await _dio.get(
      '/quotes2',
      queryParameters: {
        'page': page,
      },
    );
    final data = Map<String, dynamic>.from(response.data ?? {});
    if (data.isEmpty) return null;
    return QuoteListModel.fromMap(data).toEntity();
  }

  @override
  Future<List<VideoEntity>?> getAllVideos(int page) async {
    final response = await _dio.get(
      '/videos',
      queryParameters: {
        'page': page,
      },
    );
    final data = List<Map<String, dynamic>>.from(response.data ?? []);
    if (data.isEmpty) return null;
    return data.map((e) => VideoModel.fromMap(e).toEntity()).toList();
  }
}
