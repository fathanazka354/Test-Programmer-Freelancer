import 'package:equatable/equatable.dart';

class CreateUser extends Equatable {
  final String id;
  final String email;
  final String firstName;
  final String lastName;

  const CreateUser(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,});

  @override
  List<Object?> get props => [
        id,
        email,
        firstName,
        lastName,
      ];

  factory CreateUser.empty() => const CreateUser(
      id: '', email: '', firstName: '', lastName: '');
}
