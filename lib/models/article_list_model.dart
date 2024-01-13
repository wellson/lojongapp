import '../entities/article_list_entity.dart';
import 'article_model.dart';

final class ArticleListModel {
  final bool hasMore;
  final int currentPage;
  final int lastPage;
  final int nextPage;
  final List<ArticleModel> articles;

  const ArticleListModel({
    required this.hasMore,
    required this.currentPage,
    required this.lastPage,
    required this.nextPage,
    required this.articles,
  });

  factory ArticleListModel.fromMap(Map<String, dynamic> map) {
    final list = List<Map<String, dynamic>>.from(map['list'] ?? []);
    return ArticleListModel(
      hasMore: map['hasMore'] ?? false,
      currentPage: map['current_page'] ?? 0,
      lastPage: map['last_page'] ?? 0,
      nextPage: int.tryParse(map['next_page'].toString()) ?? 0,
      articles: list.map(ArticleModel.fromMap).toList(),
    );
  }

  ArticleListEntity toEntity() {
    return ArticleListEntity(
      hasMore: hasMore,
      currentPage: currentPage,
      lastPage: lastPage,
      nextPage: nextPage,
      articles: articles.map((e) => e.toEntity()).toList(),
    );
  }
}
