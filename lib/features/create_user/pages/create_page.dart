import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_selection_app/common/utils.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text('Please input your identity!'),
            const SizedBox(
              height: 20,
            ),
            FormSection(
              title: 'Email',
              controller: createUserBloc.emailController,
              label: 'Please Input your Email',
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
              title: 'First Name',
              controller: createUserBloc.firstNameController,
              label: 'Please Input your First Name',
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
              title: 'Last Name',
              controller: createUserBloc.lastNameController,
              label: 'Please Input your Last Name',
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
                child: const Text('Submit')),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<CreateUserBloc, CreateUserState>(
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
                String formattedString = '';
                if (state.user.createdAt != '') {
                  formattedString =
                      convertStringToDatetime(state.user.createdAt);
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Output Data',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('ID : ${state.user.id}'),
                    Text(
                        'Nama : ${state.user.firstName} ${state.user.lastName}'),
                    Text('Email : ${state.user.email}'),
                    Text('Created At : $formattedString'),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
