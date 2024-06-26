import 'package:equatable/equatable.dart';
import 'package:test_selection_app/domain/entities/create_user.dart';

class CreateUserModel extends Equatable {
  final String id;
  final String email;
  final String firstName;
  final String lastName;

  const CreateUserModel(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName});

  factory CreateUserModel.fromJson(Map<String, dynamic> json) => CreateUserModel(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'first_name': firstName,
        'last_name': lastName,
      };

  CreateUser toEntity() {
    return CreateUser(
        id: id,
        email: email,
        firstName: firstName,
        lastName: lastName,);
  }

  @override
  List<Object?> get props => [
        id,
        email,
        firstName,
        lastName,
      ];
}
