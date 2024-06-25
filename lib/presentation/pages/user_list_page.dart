import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_selection_app/presentation/bloc/user_list_bloc.dart';

import '../widgets/widgets.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      final userBloc = context.read<UserListBloc>();
      if (scrollController.offset ==
          scrollController.position.maxScrollExtent) {
        if (userBloc.currentPage <= userBloc.maxPage) {
          context.read<UserListBloc>().add(FetchUserDataMore());
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userBloc = context.watch<UserListBloc>();
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async => userBloc.add(FetchUserData()),
        child: BlocBuilder<UserListBloc, UserListState>(
          builder: (context, state) {
            if (state.status == BlocStatus.loading) {
              return const LoadingSection();
            } else if (state.status == BlocStatus.failed) {
              return ErrorSection(
                userBloc: userBloc,
                onPressed: () => userBloc
                  ..add(FetchUserData())
                  ..currentPage = 0
                  ..isLoadMore = false,
              );
            } else {
              return SuccessSection(
                  scrollController: scrollController, userBloc: userBloc);
            }
          },
        ),
      ),
    );
  }
}
