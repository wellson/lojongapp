final class ArticleEntity {
  final int id;
  final int premium;
  final int order;
  final String title;
  final String text;
  final String image;
  final String imageUrl;
  final String authorName;
  final String authorDescription;
  final String authorImage;
  final String url;
  final String content;

  const ArticleEntity({
    required this.id,
    required this.premium,
    required this.order,
    required this.title,
    required this.text,
    required this.image,
    required this.imageUrl,
    required this.authorName,
    required this.authorDescription,
    required this.authorImage,
    required this.url,
    required this.content,
  });
}
