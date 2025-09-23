import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/suggested_user_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<SuggestedUserEntity>>> getSuggestedUsers();
}
