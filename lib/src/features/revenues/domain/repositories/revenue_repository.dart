import 'package:dartz/dartz.dart';
import 'package:lawers/core/errors/error_model.dart';
import 'package:lawers/src/features/revenues/data/model/revenue_model.dart';

abstract class RevenueRepository {
  Future<Either<ErrorModel, List<RevenueModel>>> getRevenues();
  Future<Either<ErrorModel, void>> addRevenue(RevenueModel revenue);
  Future<Either<ErrorModel, void>> updateRevenue(RevenueModel revenue);
  Future<Either<ErrorModel, void>> deleteRevenue(int id);
}
