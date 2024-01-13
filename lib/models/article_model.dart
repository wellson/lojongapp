import '../entities/article_entity.dart';

final class ArticleModel {
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

  const ArticleModel({
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

  factory ArticleModel.fromMap(Map<String, dynamic> map) {
    return ArticleModel(
      id: map['id'] ?? 0,
      premium: map['premium'] ?? 0,
      order: map['order'] ?? 0,
      title: map['title'] ?? '',
      text: map['text'] ?? '',
      image: map['image'] ?? '',
      imageUrl: map['image_url'] ?? '',
      authorName: map['author_name'] ?? '',
      authorDescription: map['author_description'] ?? '',
      authorImage: map['author_image'] ?? '',
      url: map['url'] ?? '',
      content: map['full_text'] ?? '',
    );
  }

  ArticleEntity toEntity() {
    return ArticleEntity(
      id: id,
      premium: premium,
      order: order,
      title: title,
      text: text,
      image: image,
      imageUrl: imageUrl,
      authorName: authorName,
      authorDescription: authorDescription,
      authorImage: authorImage,
      url: url,
      content: content,
    );
  }
}
