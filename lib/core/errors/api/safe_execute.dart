import 'package:dartz/dartz.dart';

import '../error_handler_service.dart';
import '../failures.dart';

/// This function is used to handle the exceptions that may occur
/// during the execution of a request.
///
/// It takes a request function as a parameter
/// and returns a Future of Either of Failure and T.
Future<Either<Failure, T>> safeExecute<T>({
  required Future<T> Function() request,
}) async {
  try {
    final response = await request();
    return Right(response);
  } on Exception catch (e) {
    return Left(ErrorHandlerService().handle(e));
  }
}
