import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:test_selection_app/common/exception.dart';
import 'package:test_selection_app/common/failure.dart';
import 'package:test_selection_app/data/datasources/user_remote_datasources.dart';
import 'package:test_selection_app/domain/entities/pagination.dart';
import 'package:test_selection_app/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSources userRemoteDataSources;

  UserRepositoryImpl({required this.userRemoteDataSources});
  @override
  Future<Either<Failure, Pagination>> getAllData(int page) async {
    try {
      final result = await userRemoteDataSources.getAllDataUser(page);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(message: 'Error Server'));
    } on SocketException {
      return const Left(
          ConnectionFailure(message: 'Failed to connect to internet'));
    }
  }
}
