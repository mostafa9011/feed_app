import 'package:dartz/dartz.dart';

import '../../../../core/errors/api/safe_execute.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/suggested_user_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';
import '../models/post_model.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _homeRemoteDataSource;

  HomeRepositoryImpl(this._homeRemoteDataSource);

  @override
  Future<Either<Failure, List<SuggestedUserEntity>>> getSuggestedUsers() async {
    return safeExecute(request: _homeRemoteDataSource.getSuggestedUsers);
  }

  @override
  Future<Either<Failure, void>> createPost({required PostModel post}) async {
    return safeExecute(
      request: () => _homeRemoteDataSource.createPost(post: post),
    );
  }

  @override
  Future<Either<Failure, List<PostModel>>> getPosts() async {
    return safeExecute(request: _homeRemoteDataSource.getPosts);
  }

  @override
  Future<Either<Failure, void>> toggleLike({
    required String postId,
    required String userId,
  }) async {
    return safeExecute(
      request: () =>
          _homeRemoteDataSource.toggleLike(postId: postId, userId: userId),
    );
  }
}
