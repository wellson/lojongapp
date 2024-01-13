import 'article_entity.dart';

final class ArticleListEntity {
  final bool hasMore;
  final int currentPage;
  final int lastPage;
  final int nextPage;
  final List<ArticleEntity> articles;

  const ArticleListEntity({
    required this.hasMore,
    required this.currentPage,
    required this.lastPage,
    required this.nextPage,
    required this.articles,
  });
}
