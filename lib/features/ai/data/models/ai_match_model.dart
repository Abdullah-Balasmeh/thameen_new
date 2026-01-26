class AiMatchModel {
  final String postId;
  final double score;
  final String? status;
  final String itemName;
  final String itemCategory;
  final List<String> photoUrls;
  final String location;
  final DateTime createdAt;

  AiMatchModel({
    required this.postId,
    required this.score,
    required this.status,
    required this.itemName,
    required this.itemCategory,
    required this.photoUrls,
    required this.location,
    required this.createdAt,
  });

  factory AiMatchModel.fromJson(Map<String, dynamic> json) {
    return AiMatchModel(
      postId: json['post_id']?.toString() ?? '',
      score: (json['score'] as num?)?.toDouble() ?? 0.0,
      status: json['status']?.toString(),
      itemName: json['itemName']?.toString() ?? 'Unknown',
      itemCategory: json['itemCategory']?.toString() ?? 'Unknown',
      photoUrls:
          (json['photoUrls'] as List?)?.map((e) => e.toString()).toList() ?? [],
      location: json['location']?.toString() ?? 'Unknown',
      createdAt: DateTime.parse(json['createdAt']?.toString() ?? ''),
    );
  }
}
