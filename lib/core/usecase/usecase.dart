import 'package:app1/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UseCase<SuccessType, Params>{
  Future<Either<Failure, SuccessType>> call(Params params);

}