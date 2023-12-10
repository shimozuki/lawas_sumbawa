class AboutModel {
  final int id;
  final String description;
  final String updatedAt;

  AboutModel({
    required this.id,
    required this.description,
    required this.updatedAt,
  });

  factory AboutModel.fromJson(Map<String, dynamic> json) {
    return AboutModel(
      id: json['id'],
      description: json['description'],
      updatedAt: json['updated_at'],
    );
  }
}
