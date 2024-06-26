import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:test_selection_app/domain/usecases/get_user_data.dart';
import 'package:test_selection_app/features/create_user/pages/create_page.dart';
import 'package:test_selection_app/injection.dart' as di;
import 'package:test_selection_app/features/list_user/bloc/user_list_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_selection_app/features/list_user/pages/user_list_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
    initializeDateFormatting('id_ID', null).then((_) => runApp(const MyApp()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserListBloc(di.locator<GetUserData>())..add(FetchUserData()),
      child:  MaterialApp.router(
        title: 'Test Flutter',
        routerConfig: _router,
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const UserListPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'create',
          name: 'create',
          builder: (BuildContext context, GoRouterState state) {
            return const CreatePage();
          },
        ),
      ],
    ),
  ],
);