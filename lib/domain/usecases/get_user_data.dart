import 'package:dartz/dartz.dart';
import 'package:test_selection_app/common/failure.dart';
import 'package:test_selection_app/domain/entities/pagination.dart';
import 'package:test_selection_app/domain/repositories/user_repository.dart';

class GetUserData {
  final UserRepository _userRepository;

  GetUserData({required UserRepository userRepository})
      : _userRepository = userRepository;
  Future<Either<Failure, Pagination>> call(GetUserDataParam param) {
    return _userRepository.getAllData(param.page);
  }
}

class GetUserDataParam {
  final int page;

  GetUserDataParam({required this.page});
}
