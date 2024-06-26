import 'package:dartz/dartz.dart';
import 'package:test_selection_app/common/failure.dart';
import 'package:test_selection_app/domain/entities/create_user.dart';
import 'package:test_selection_app/domain/repositories/user_repository.dart';

class CreateUserData {
  final UserRepository _userRepository;

  CreateUserData({required UserRepository userRepository})
      : _userRepository = userRepository;
  Future<Either<Failure, CreateUser>> call(CreateUserDataParam param) {
    return _userRepository.createUserData(
      email: param.email,
      firstName: param.firstName,
      lastName: param.lastName
    );
  }
}

class CreateUserDataParam {
  final String email;
  final String firstName;
  final String lastName;

  CreateUserDataParam({required this.email, required this.firstName, required this.lastName});
}
