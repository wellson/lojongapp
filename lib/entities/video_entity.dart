final class VideoEntity {
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

  const VideoEntity({
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
}
