import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  String? id;
  String title;
  String description;
  String imageUrl;
  String userId;
  List<String> likes;
  DateTime? createdAt;

  PostModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.userId,
    this.likes = const [],
    this.id,
    this.createdAt,
  });

  factory PostModel.fromJson(Map<String, dynamic> json, String id) {
    return PostModel(
      id: id,
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      userId: json['userId'],
      likes: List<String>.from(json['likes'] ?? []),
      createdAt: json['createdAt'] != null
          ? (json['createdAt'] as Timestamp).toDate()
          : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "title": title,
      "description": description,
      "imageUrl": imageUrl,
      "userId": userId,
      "likes": likes,
      "createdAt": createdAt ?? FieldValue.serverTimestamp(),
    };
  }
}
