import 'package:equatable/equatable.dart';
import 'package:test_selection_app/domain/entities/user.dart';

class Pagination extends Equatable {
  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<User> data;

  const Pagination(
      {required this.page,
      required this.perPage,
      required this.total,
      required this.totalPages,
      required this.data});

  @override
  List<Object?> get props => [
        page,
        perPage,
        total,
        totalPages,
        data,
      ];
}
