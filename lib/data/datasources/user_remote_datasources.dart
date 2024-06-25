import 'package:test_selection_app/common/constant.dart';
import 'package:test_selection_app/common/exception.dart';
import 'package:test_selection_app/data/models/pagination_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class UserRemoteDataSources {
  Future<PaginationModel> getAllDataUser(int page);
}

class UserRemoteDataSourcesImpl implements UserRemoteDataSources {
  final http.Client client;

  UserRemoteDataSourcesImpl({required this.client});
  @override
  Future<PaginationModel> getAllDataUser(int page) async {
    print('PAGE: ${page}');
    final response = await client.get(Uri.parse('$BASE_URL/users?page=$page'));

    if (response.statusCode == 200) {
      return PaginationModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
