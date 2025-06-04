import 'package:dartz/dartz.dart';
import 'package:lawers/core/errors/error_model.dart';
import 'package:lawers/src/features/revenues/domain/repositories/revenue_repository.dart';
import 'package:lawers/src/features/revenues/data/model/revenue_model.dart';

class GetRevenuesUseCase {
  final RevenueRepository repository;

  GetRevenuesUseCase(this.repository);

  Future<Either<ErrorModel, List<RevenueModel>>> call() async {
    return repository.getRevenues();
  }
}
