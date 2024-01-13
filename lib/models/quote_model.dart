import '../entities/quote_entity.dart';

final class QuoteModel {
  final int id;
  final int order;
  final String text;
  final String author;

  const QuoteModel({
    required this.id,
    required this.order,
    required this.text,
    required this.author,
  });

  factory QuoteModel.fromMap(Map<String, dynamic> map) {
    return QuoteModel(
      id: map['id'] ?? 0,
      order: map['order'] ?? 0,
      text: map['text'] ?? '',
      author: map['author'] ?? '',
    );
  }

  QuoteEntity toEntity() {
    return QuoteEntity(
      id: id,
      order: order,
      text: text,
      author: author,
    );
  }
}
