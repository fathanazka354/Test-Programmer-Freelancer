import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_selection_app/domain/usecases/create_user_data.dart';
import 'package:test_selection_app/injection.dart' as di;

import '../bloc/create_user_bloc.dart';
import '../widgets/widgets.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateUserBloc(di.locator<CreateUserData>()),
      child: const _CreatePage(),
    );
  }
}

class _CreatePage extends StatelessWidget {
  const _CreatePage();

  @override
  Widget build(BuildContext context) {
    final createUserBloc = context.watch<CreateUserBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create User'),
      ),
      body: BlocConsumer<CreateUserBloc, CreateUserState>(
        listener: (context, state) {
          if (state.status == BlocStatus.loaded) {
            context.pop();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                    'Name: ${createUserBloc.state.user.firstName} ${createUserBloc.state.user.lastName} || Name: ${createUserBloc.state.user.firstName} || Email: ${createUserBloc.state.user.email}')));
          }
        },
        builder: (context, state) {
          if (state.status == BlocStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == BlocStatus.failed) {
            return ErrorSection(
              createUserBloc: createUserBloc,
              onPressed: () => context.pop(),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: createUserBloc.key,
              child: ListView(
                children: [
                  const Text('Silakan Input data diri anda!'),
                  const SizedBox(
                    height: 20,
                  ),
                  FormSection(
                    title: '',
                    controller: createUserBloc.emailController,
                    label: 'Email',
                    onChanged: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please input your email';
                      }
                      return '';
                    },
                    hintText: 'Input your email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  FormSection(
                    title: '',
                    controller: createUserBloc.firstNameController,
                    label: 'First Name',
                    onChanged: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please input your first name';
                      }
                      return '';
                    },
                    hintText: 'Input your first name',
                    keyboardType: TextInputType.name,
                  ),
                  FormSection(
                    title: '',
                    controller: createUserBloc.lastNameController,
                    label: 'Last Name',
                    onChanged: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please input your last name';
                      }
                      return '';
                    },
                    hintText: 'Input your last name',
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () => createUserBloc.add(CreateUserDataEvent(
                          email: createUserBloc.emailController.text,
                          firstName: createUserBloc.firstNameController.text,
                          lastName: createUserBloc.lastNameController.text)),
                      child: const Text('Submit'))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
