import 'package:equatable/equatable.dart';
import 'package:test_selection_app/data/models/user_model.dart';
import 'package:test_selection_app/domain/entities/pagination.dart';

class PaginationModel extends Equatable {
  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<UserModel> data;

  const PaginationModel(
      {required this.page,
      required this.perPage,
      required this.total,
      required this.totalPages,
      required this.data});

  factory PaginationModel.fromJson(Map<String, dynamic> json) => PaginationModel(
      page: json['page'],
      perPage: json['per_page'],
      total: json['total'],
      totalPages: json['total_pages'],
      data: List<UserModel>.from(json['data'].map((e) => UserModel.fromJson(e))));

  Map<String, dynamic> toJson() => {
        'page': page,
        'per_page': perPage,
        'total': total,
        'total_pages': totalPages,
        'data': List<dynamic>.from(data.map((e) => e)),
      };

  Pagination toEntity() {
    return Pagination(
        total: total,
        totalPages: totalPages,
        page: page,
        perPage: perPage,
        data: data.map((e) => e.toEntity()).toList());
  }

  @override
  List<Object?> get props => [
        total,
        perPage,
        page,
        totalPages,
        data,
      ];
}
