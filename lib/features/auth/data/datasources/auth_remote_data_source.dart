import '../../../../core/services/firebase_auth_service.dart';
import '../../../../core/services/firestore_service.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signIn({
    required String email,
    required String password,
  });

  Future<UserModel> signUp({
    required String username,
    required String email,
    required String password,
  });

  Future<UserModel> signInWithGoogle();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    final user = await FirebaseAuthService.signIn(
      email: email,
      password: password,
    );

    final userModel = await FirestoreService.getUser(user!.uid);
    return userModel;
  }

  @override
  Future<UserModel> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    // Sign up the user
    final user = await FirebaseAuthService.signUp(
      email: email,
      password: password,
    );

    // Save additional user info in Firestore

    final userModel = UserModel(
      uid: user!.uid,
      email: user.email!,
      username: username,
      createdAt: DateTime.now(),
    );

    await FirestoreService.saveUser(userModel);

    return userModel;
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    final user = await FirebaseAuthService.signInWithGoogle();

    // Save additional user info in Firestore

    final userModel = UserModel(
      uid: user!.uid,
      email: user.email!,
      username: user.displayName ?? user.email!.split('@')[0],
      createdAt: DateTime.now(),
    );

    await FirestoreService.saveUser(userModel);

    return userModel;
  }
}
