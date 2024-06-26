import 'package:equatable/equatable.dart';

class CreateUser extends Equatable {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String createdAt;

  const CreateUser(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.createdAt,
      required this.lastName,});

  @override
  List<Object?> get props => [
        id,
        email,
        createdAt,
        firstName,
        lastName,
      ];

  factory CreateUser.empty() => const CreateUser(
      id: '', email: '', firstName: '', lastName: '',createdAt: '');
}
