import '../entities/video_entity.dart';

final class VideoModel {
  final int id;
  final int premium;
  final int order;
  final String name;
  final String description;
  final String image;
  final String imageUrl;
  final String fileUrl;
  final String vimeoUrl;
  final String youtubeUrl;
  final String awsUrl;

  const VideoModel({
    required this.id,
    required this.premium,
    required this.order,
    required this.name,
    required this.description,
    required this.image,
    required this.imageUrl,
    required this.fileUrl,
    required this.vimeoUrl,
    required this.youtubeUrl,
    required this.awsUrl,
  });

  factory VideoModel.fromMap(Map<String, dynamic> map) {
    return VideoModel(
      id: map['id'] ?? 0,
      premium: map['premium'] ?? 0,
      order: map['order'] ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      image: map['image'] ?? '',
      imageUrl: map['image_url'] ?? '',
      fileUrl: map['file'] ?? '',
      vimeoUrl: map['url'] ?? '',
      youtubeUrl: map['url2'] ?? '',
      awsUrl: map['aws_url'] ?? '',
    );
  }

  VideoEntity toEntity() {
    return VideoEntity(
      id: id,
      premium: premium,
      order: order,
      name: name,
      description: description,
      image: image,
      imageUrl: imageUrl,
      fileUrl: fileUrl,
      vimeoUrl: vimeoUrl,
      youtubeUrl: youtubeUrl,
      awsUrl: awsUrl,
    );
  }
}
