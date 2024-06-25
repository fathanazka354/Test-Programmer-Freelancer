import 'package:flutter/material.dart';
import 'package:test_selection_app/domain/usecases/get_user_data.dart';
import 'package:test_selection_app/injection.dart' as di;
import 'package:test_selection_app/presentation/bloc/user_list_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_selection_app/presentation/pages/user_list_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserListBloc(di.locator<GetUserData>())..add(FetchUserData()),
      child: const MaterialApp(
        title: 'Test Flutter',
        home: UserListPage(),
      ),
    );
  }
}
