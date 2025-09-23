import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String uid;
  String email;
  String username;
  DateTime? createdAt;

  UserModel({
    required this.uid,
    required this.email,
    required this.username,
    this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      email: json['email'],
      username: json['username'],
      createdAt: (json['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "uid": uid,
      "email": email,
      "username": username,
      "createdAt": createdAt ?? FieldValue.serverTimestamp(),
    };
  }
}
