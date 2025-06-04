import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:lawers/core/data/api/dio_consumer.dart';
import 'package:lawers/core/errors/error_model.dart';
import 'package:lawers/core/errors/exceptions.dart';
import 'package:lawers/src/features/revenues/data/data_source/remote_data_source.dart';
import 'package:lawers/src/features/revenues/data/model/revenue_model.dart';
import 'package:lawers/src/features/revenues/domain/repositories/revenue_repository.dart';

class RevenueRepositoryImpl implements RevenueRepository {
  final RemoteDataSource remoteDataSource;
  RevenueRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<ErrorModel, void>> addRevenue(RevenueModel revenue) {
    // TODO: implement addRevenue
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorModel, void>> deleteRevenue(int id) {
    // TODO: implement deleteRevenue
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorModel, List<RevenueModel>>> getRevenues() {
    return remoteDataSource.getRevenues();
  }

  @override
  Future<Either<ErrorModel, void>> updateRevenue(RevenueModel revenue) {
    // TODO: implement updateRevenue
    throw UnimplementedError();
  }
}
