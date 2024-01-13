import '../entities/article_entity.dart';
import '../entities/article_list_entity.dart';
import '../entities/quote_list_entity.dart';
import '../entities/video_entity.dart';

abstract interface class InspirationRepository {
  Future<ArticleListEntity?> getAllArticles(int page);
  Future<ArticleEntity?> getArticleById(int articleId);
  Future<QuoteListEntity?> getAllQuotes(int page);
  Future<List<VideoEntity>?> getAllVideos(int page);
}
