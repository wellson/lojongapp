import 'quote_entity.dart';

final class QuoteListEntity {
  final bool hasMore;
  final int currentPage;
  final int lastPage;
  final int nextPage;
  final List<QuoteEntity> quotes;

  const QuoteListEntity({
    required this.hasMore,
    required this.currentPage,
    required this.lastPage,
    required this.nextPage,
    required this.quotes,
  });
}
