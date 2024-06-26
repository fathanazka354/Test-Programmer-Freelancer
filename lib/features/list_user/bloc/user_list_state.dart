part of 'user_list_bloc.dart';
class UserListState extends Equatable{
  final List<User> users;
  final BlocStatus status;
  final String errorMessage;

  const UserListState( {required this.users, required this.status,required this.errorMessage,});
  
  factory UserListState.initial(){
    return const UserListState(users: [], status: BlocStatus.loading,errorMessage: '');
  }
  UserListState copyWith({
    BlocStatus? status,
    List<User>? users,
    String? errorMessage,
  })=>  UserListState(users: users ?? this.users, status: status??this.status,errorMessage: errorMessage ?? this.errorMessage);
  @override
  List<Object?> get props => [
    users,
    status,
    errorMessage,
  ]; 
}

enum BlocStatus { loading, loadingMore, loaded,empty, failedMore,failed}