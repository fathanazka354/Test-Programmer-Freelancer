
part of 'user_list_bloc.dart';

abstract class UserListEvent extends Equatable {
  const UserListEvent();

  @override
  List<Object?> get props => [];
}

class FetchUserData extends UserListEvent {
  
}
class FetchUserDataMore extends UserListEvent {
  
}

// class FetchUserData extends UserListEvent {
  
// }