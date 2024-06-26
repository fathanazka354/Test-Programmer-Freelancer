
part of 'create_user_bloc.dart';

abstract class CreateUserEvent extends Equatable {
  const CreateUserEvent();

  @override
  List<Object?> get props => [];
}

class CreateUserDataEvent extends CreateUserEvent {
  final String email;
  final String firstName;
  final String lastName;

  const CreateUserDataEvent({required this.email, required this.firstName, required this.lastName});

  @override
  List<Object?> get props => [
    email,
    firstName,
    lastName,
  ];
}

// class FetchUserData extends CreateUserEvent {
  
// }