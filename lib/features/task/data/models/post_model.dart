import 'package:ysolultion/features/task/domain/entities/post_entities.dart';

class PostModel extends PostEntities {
  const PostModel({
    required super.userId,
    required super.id,
    required super.title,
    required super.body,
  });
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json['userId'],
      id: json["id"],
      title: json["title"],
      body: json["body"],
    );
  }
}
