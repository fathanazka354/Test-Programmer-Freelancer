import 'package:get_it/get_it.dart';
import 'package:test_selection_app/data/datasources/user_remote_datasources.dart';
import 'package:test_selection_app/data/repositories/user_repository_impl.dart';
import 'package:test_selection_app/domain/repositories/user_repository.dart';
import 'package:test_selection_app/domain/usecases/get_user_data.dart';
import 'package:test_selection_app/presentation/bloc/user_list_bloc.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init() {
  locator.registerFactory(() => UserListBloc(locator()));
  locator.registerFactory(() => GetUserData(userRepository: locator()));
  locator.registerFactory<UserRepository>(
      () => UserRepositoryImpl(userRemoteDataSources: locator()));
  locator.registerFactory<UserRemoteDataSources>(
      () => UserRemoteDataSourcesImpl(client: locator()));
  locator.registerLazySingleton(() => http.Client());
}
