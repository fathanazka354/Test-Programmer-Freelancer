
import 'package:flutter/material.dart';
import 'package:test_selection_app/presentation/bloc/user_list_bloc.dart';

class ErrorSection extends StatelessWidget {
  const ErrorSection({
    super.key,
    required this.userBloc,required this.onPressed,
  });

  final UserListBloc userBloc;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(userBloc.state.errorMessage),
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
