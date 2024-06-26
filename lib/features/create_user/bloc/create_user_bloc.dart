import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:test_selection_app/domain/entities/create_user.dart';
import 'package:test_selection_app/domain/usecases/create_user_data.dart';
part 'create_user_state.dart';
part 'create_user_event.dart';

class CreateUserBloc extends Bloc<CreateUserEvent, CreateUserState> {
  final CreateUserData createUserData;
  final key = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  CreateUserBloc(this.createUserData) : super(CreateUserState.initial()) {
    on<CreateUserDataEvent>(_createUserData);
  }
  FutureOr<void> _createUserData(
      CreateUserDataEvent event, Emitter<CreateUserState> emit) async {
    if (key.currentState!.validate()) {
      emit(state.copyWith(status: BlocStatus.loading));

      await createUserData(CreateUserDataParam(
              email: event.email,
              firstName: event.firstName,
              lastName: event.lastName))
          .then((value) => value.fold(
              (l) => emit(state.copyWith(
                  errorMessage: l.message, status: BlocStatus.failed)),
              (r) => emit(state.copyWith(user: r, status: BlocStatus.loaded))));
    }
  }
}
