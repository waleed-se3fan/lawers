import 'package:dartz/dartz.dart';
import 'package:lawers/core/errors/error_model.dart';
import 'package:lawers/src/features/revenues/domain/repositories/revenue_repository.dart';

class DeleteRevenueUseCase {
  final RevenueRepository repository;

  DeleteRevenueUseCase(this.repository);

  Future<Either<ErrorModel, void>> call(int id) async {
    return await repository.deleteRevenue(id);
  }
}
