// detail_model.dart

class DetaillawasModel {
  final int id;
  final String mainTitle;
  final String lirikIndo;
  final String linkYoutube;
  final String lirikSwq;
  final String image;
  final String audio;
  final int hitCount;

  DetaillawasModel({
    required this.id,
    required this.mainTitle,
    required this.lirikIndo,
    required this.linkYoutube,
    required this.lirikSwq,
    required this.image,
    required this.audio,
    required this.hitCount,
  });

  factory DetaillawasModel.fromJson(Map<String, dynamic> json) {
    return DetaillawasModel(
      id: json['data']['id'],
      mainTitle: json['data']['main_title'],
      lirikIndo: json['data']['lirik_indo'],
      linkYoutube: json['data']['link_yt'],
      lirikSwq: json['data']['lirik_swq'],
      image: json['data']['image'],
      audio: json['data']['audio'],
      hitCount: int.parse(json['data']['hit_count']),
    );
  }
}
