import 'package:test_selection_app/common/constant.dart';
import 'package:test_selection_app/common/exception.dart';
import 'package:test_selection_app/data/models/create_user_model.dart';
import 'package:test_selection_app/data/models/pagination_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


abstract class UserRemoteDataSources {
  Future<PaginationModel> getAllDataUser(int page);
  Future<CreateUserModel> createDataUser(
      {required String email,required  String firstName,required  String lastName});
}

class UserRemoteDataSourcesImpl implements UserRemoteDataSources {
  final http.Client client;

  UserRemoteDataSourcesImpl({required this.client});
  @override
  Future<PaginationModel> getAllDataUser(int page) async {
    final response = await client.get(Uri.parse('$BASEURL/users?page=$page'));

    if (response.statusCode == 200) {
      return PaginationModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<CreateUserModel> createDataUser(
      {required String email,
      required String firstName,
      required String lastName}) async {
    final body = {
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
    };
    final response = await client.post(
        Uri.parse(
          '$BASEURL/users',
        ),
        body: body);
    if (response.statusCode == 201) {
      return CreateUserModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
