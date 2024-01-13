final class QuoteEntity {
  final int id;
  final int order;
  final String text;
  final String author;

  const QuoteEntity({
    required this.id,
    required this.order,
    required this.text,
    required this.author,
  });
}
