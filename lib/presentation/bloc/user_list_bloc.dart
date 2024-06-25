import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_selection_app/domain/entities/user.dart';
import 'package:test_selection_app/domain/usecases/get_user_data.dart';
part 'user_list_state.dart';
part 'user_list_event.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  final GetUserData getUserData;
  int currentPage = 1;
  int maxPage = 0;
  bool isLoadMore = false;

  UserListBloc(this.getUserData) : super(UserListState.initial()) {
    on<FetchUserData>(_fetchUserData);
    on<FetchUserDataMore>(_fetchUserDataMore);
  }

  FutureOr<void> _fetchUserData(
      FetchUserData event, Emitter<UserListState> emit) async {
    emit(state.copyWith(status: BlocStatus.loading));

    await getUserData(GetUserDataParam(page: 1)).then((value) => value.fold(
            (l) => emit(state.copyWith(
                errorMessage: l.message, status: BlocStatus.failed)), (r) {
                  maxPage = r.totalPages;
          if (r.data.isEmpty) {
            emit(state.copyWith(users: [], status: BlocStatus.empty));
          } else {
            currentPage++;
            emit(state.copyWith(users: r.data, status: BlocStatus.loaded));
          }
        }));
  }

  FutureOr<void> _fetchUserDataMore(
      FetchUserDataMore event, Emitter<UserListState> emit) async {
    emit(state.copyWith(status: BlocStatus.loadingMore));
    isLoadMore = true;
    await getUserData(GetUserDataParam(page: currentPage)).then((value) => value
            .fold(
                (l) => emit(state.copyWith(
                    errorMessage: l.message,
                    status: BlocStatus.failedMore)), (r) {
          if (r.page > r.totalPages) {
            isLoadMore = false;
            emit(state.copyWith(status: BlocStatus.empty));
          } else {
    currentPage++;
            isLoadMore = false;
            emit(state.copyWith(
                users: [...state.users, ...r.data], status: BlocStatus.loaded));
          }
        }));
  }
}
