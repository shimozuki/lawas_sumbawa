class LawasModel {
  final int id;
  final String categoryId;
  final String authorId;
  final String mainTitle;
  final String lirikIndo;
  final String linkYoutube;
  final String lirikSwq;
  final String image;
  final String audio;
  final String hitCount;
  final String featuredStatus;
  final String status;
  final String createdAt;
  final String updatedAt;

  LawasModel({
    required this.id,
    required this.categoryId,
    required this.authorId,
    required this.mainTitle,
    required this.lirikIndo,
    required this.linkYoutube,
    required this.lirikSwq,
    required this.image,
    required this.audio,
    required this.hitCount,
    required this.featuredStatus,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LawasModel.fromJson(Map<String, dynamic> json) {
    return LawasModel(
      id: json['id'],
      categoryId: json['category_id'],
      authorId: json['author_id'],
      mainTitle: json['main_title'],
      lirikIndo: json['lirik_indo'],
      linkYoutube: json['link_yt'],
      lirikSwq: json['lirik_swq'],
      image: json['image'],
      audio: json['audio'],
      hitCount: json['hit_count'],
      featuredStatus: json['featured_status'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
