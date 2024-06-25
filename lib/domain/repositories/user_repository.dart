import 'package:dartz/dartz.dart';
import 'package:test_selection_app/common/failure.dart';
import 'package:test_selection_app/domain/entities/pagination.dart';

abstract class UserRepository {
  Future<Either<Failure, Pagination>> getAllData(int page);
}
