import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../data/models/post_model.dart';
import '../entities/suggested_user_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<SuggestedUserEntity>>> getSuggestedUsers();

  Future<Either<Failure, void>> createPost({required PostModel post});

  Future<Either<Failure, List<PostModel>>> getPosts();
}
