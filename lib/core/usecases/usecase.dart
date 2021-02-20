import 'package:clean_architecture_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class UserCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
