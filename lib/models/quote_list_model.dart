import '../entities/quote_list_entity.dart';
import 'quote_model.dart';

final class QuoteListModel {
  final bool hasMore;
  final int currentPage;
  final int lastPage;
  final int nextPage;
  final List<QuoteModel> quotes;

  const QuoteListModel({
    required this.hasMore,
    required this.currentPage,
    required this.lastPage,
    required this.nextPage,
    required this.quotes,
  });

  factory QuoteListModel.fromMap(Map<String, dynamic> map) {
    final list = List<Map<String, dynamic>>.from(map['list'] ?? []);
    return QuoteListModel(
      hasMore: map['hasMore'] ?? false,
      currentPage: map['current_page'] ?? 0,
      lastPage: map['last_page'] ?? 0,
      nextPage: int.tryParse(map['next_page'].toString()) ?? 0,
      quotes: list.map(QuoteModel.fromMap).toList(),
    );
  }

  QuoteListEntity toEntity() {
    return QuoteListEntity(
      hasMore: hasMore,
      currentPage: currentPage,
      lastPage: lastPage,
      nextPage: nextPage,
      quotes: quotes.map((e) => e.toEntity()).toList(),
    );
  }
}
