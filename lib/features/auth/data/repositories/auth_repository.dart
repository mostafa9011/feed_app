import 'package:dartz/dartz.dart';

import '../../../../core/errors/api/safe_execute.dart';
import '../../../../core/errors/failures.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/user_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserModel>> signIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserModel>> signUp({
    required String username,
    required String email,
    required String password,
  });

  Future<Either<Failure, UserModel>> signInWithGoogle();
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, UserModel>> signIn({
    required String email,
    required String password,
  }) async {
    return safeExecute(
      request: () {
        return remoteDataSource.signIn(
          email: email,
          password: password,
        );
      },
    );
  }

  @override
  Future<Either<Failure, UserModel>> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    return safeExecute(
      request: () {
        return remoteDataSource.signUp(
          username: username,
          email: email,
          password: password,
        );
      },
    );
  }

  @override
  Future<Either<Failure, UserModel>> signInWithGoogle() async {
    return safeExecute(
      request: () {
        return remoteDataSource.signInWithGoogle();
      },
    );
  }
}
