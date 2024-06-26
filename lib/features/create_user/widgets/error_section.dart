
import 'package:flutter/material.dart';
import 'package:test_selection_app/features/create_user/bloc/create_user_bloc.dart';

class ErrorSection extends StatelessWidget {
  const ErrorSection({
    super.key,
    required this.createUserBloc,required this.onPressed,
  });

  final CreateUserBloc createUserBloc;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(createUserBloc.state.errorMessage),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: onPressed,
              child: const Text('Reload'))
        ],
      ),
    );
  }
}
