import 'package:dartz/dartz.dart';

import '../../../../core/errors/api/safe_execute.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/suggested_user_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _homeRemoteDataSource;

  HomeRepositoryImpl(this._homeRemoteDataSource);

  @override
  Future<Either<Failure, List<SuggestedUserEntity>>> getSuggestedUsers() async {
    return safeExecute(request: _homeRemoteDataSource.getSuggestedUsers);
  }
}
