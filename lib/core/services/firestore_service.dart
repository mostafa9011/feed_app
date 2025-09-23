import 'package:cloud_firestore/cloud_firestore.dart';

import '../../features/auth/data/models/user_model.dart';

class FirestoreService {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Users Collection
  static CollectionReference<UserModel> usersRef =
      _db.collection("users").withConverter<UserModel>(
            fromFirestore: (snapshot, options) =>
                UserModel.fromJson(snapshot.data()!),
            toFirestore: (user, options) => user.toFirestore(),
          );

  // // Posts Collection
  // static CollectionReference<PostModel> postsRef =
  //     _db.collection("posts").withConverter<PostModel>(
  //           fromFirestore: (snapshot, options) =>
  //               PostModel.fromJson(snapshot.data(), snapshot.id),
  //           toFirestore: (post, options) => post.toFirestore(),
  //         );

  // Save User
  static Future<void> saveUser(UserModel user) async {
    await usersRef.doc(user.uid).set(user);
  }

  // Get User
  static Future<UserModel> getUser(String uid) async {
    final doc = await usersRef.doc(uid).get();
    return doc.data()!;
  }

  // // Create Post
  // static Future<void> createPost(PostModel post) async {
  //   final user = FirebaseAuth.instance.currentUser;
  //   if (user == null) throw Exception("No user logged in");

  //   final docRef = postsRef.doc();
  //   post.id = docRef.id;
  //   await docRef.set(post);
  // }

  // // Get Posts stream
  // static Stream<QuerySnapshot<PostModel>> getPosts() {
  //   return postsRef.orderBy("createdAt", descending: true).snapshots();
  // }

  // // Toggle Like
  // static Future<void> toggleLike(String postId, String userId) async {
  //   final postRef = postsRef.doc(postId);
  //   final doc = await postRef.get();
  //   final post = doc.data();
  //   if (post == null) return;

  //   if (post.likes.contains(userId)) {
  //     post.likes.remove(userId);
  //   } else {
  //     post.likes.add(userId);
  //   }
  //   await postRef.update(post.toFirestore());
  // }
}
