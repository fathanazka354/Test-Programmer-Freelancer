part of 'create_user_bloc.dart';

class CreateUserState extends Equatable {
  final CreateUser user;
  final BlocStatus status;
  final String errorMessage;

  const CreateUserState({
    required this.user,
    required this.status,
    required this.errorMessage,
  });

  factory CreateUserState.initial() {
    return CreateUserState(
        user: CreateUser.empty(), status: BlocStatus.initial, errorMessage: '');
  }
  
  CreateUserState copyWith({
    BlocStatus? status,
    CreateUser? user,
    String? errorMessage,
  }) =>
      CreateUserState(
          user: user ?? this.user,
          status: status ?? this.status,
          errorMessage: errorMessage ?? this.errorMessage);
  @override
  List<Object?> get props => [
        user,
        status,
        errorMessage,
      ];
}

enum BlocStatus { initial,loading, loaded, failed }
