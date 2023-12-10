// detailLawas_model.dart

class DetailLawasModel {
  final int id;
  final String categoryId;
  final String authorId;
  final String mainTitle;
  final String lirikIndo;
  final String linkYoutube;
  final String lirikSwq;
  final String image;
  final String audio;
  final int hitCount;
  final int featuredStatus;
  final int status;
  final String createdAt;
  final String updatedAt;

  DetailLawasModel({
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

  factory DetailLawasModel.fromJson(Map<String, dynamic> json) {
    return DetailLawasModel(
      id: json['data']['id'],
      categoryId: json['data']['category_id'],
      authorId: json['data']['author_id'],
      mainTitle: json['data']['main_title'],
      lirikIndo: json['data']['lirik_indo'],
      linkYoutube: json['data']['link_yt'],
      lirikSwq: json['data']['lirik_swq'],
      image: json['data']['image'],
      audio: json['data']['audio'],
      hitCount: int.parse(json['data']['hit_count']),
      featuredStatus: int.parse(json['data']['featured_status']),
      status: int.parse(json['data']['status']),
      createdAt: json['data']['created_at'],
      updatedAt: json['data']['updated_at'],
    );
  }

  void dispose() {}
}
