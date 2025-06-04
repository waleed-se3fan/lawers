import 'package:dartz/dartz.dart';
import 'package:lawers/core/errors/error_model.dart';
import 'package:lawers/src/features/revenues/domain/repositories/revenue_repository.dart';
import 'package:lawers/src/features/revenues/data/model/revenue_model.dart';

class AddRevenueUseCase {
  final RevenueRepository repository;

  AddRevenueUseCase(this.repository);

  Future<Either<ErrorModel, void>> call(RevenueModel revenue) async {
    return await repository.addRevenue(revenue);
  }
}
