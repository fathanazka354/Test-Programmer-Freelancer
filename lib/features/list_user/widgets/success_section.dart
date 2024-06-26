import 'package:flutter/material.dart';
import 'package:test_selection_app/features/list_user/bloc/user_list_bloc.dart';
import 'package:test_selection_app/features/list_user/widgets/widgets.dart';

class SuccessSection extends StatelessWidget {
  const SuccessSection({
    super.key,
    required this.scrollController,
    required this.userBloc,
  });

  final ScrollController scrollController;
  final UserListBloc userBloc;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemBuilder: (context, index) {
        if (userBloc.isLoadMore && userBloc.state.users.length == index) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
          );
        } else if (userBloc.state.status == BlocStatus.failedMore &&
            userBloc.state.users.length == index) {
        return  ErrorSection(
            userBloc: userBloc,
            onPressed: () => userBloc
              ..add(FetchUserData())
              ..isLoadMore = false,
          );
        } else {
          final data = userBloc.state.users[index];
          return Card(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(image: NetworkImage(data.avatar))),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${data.firstName} ${data.lastName}'),
                    Text(data.email),
                  ],
                ),
              ],
            ),
          ));
        }
      },
      itemCount: userBloc.isLoadMore
          ? userBloc.state.users.length + 1
          : userBloc.state.status == BlocStatus.failedMore
              ? userBloc.state.users.length + 1
              : userBloc.state.users.length,
    );
  }
}
