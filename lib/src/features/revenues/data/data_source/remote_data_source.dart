import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:lawers/core/data/api/api_consumer.dart';
import 'package:lawers/core/data/api/dio_consumer.dart';
import 'package:lawers/core/errors/error_model.dart';
import 'package:lawers/core/errors/exceptions.dart';
import 'package:lawers/src/features/revenues/data/model/revenue_model.dart';

abstract class RemoteDataSource {
  Future<Either<ErrorModel, List<RevenueModel>>> getRevenues();
  Future<Either<ErrorModel, void>> addRevenue(RevenueModel revenue);
  Future<Either<ErrorModel, void>> updateRevenue(RevenueModel revenue);
  Future<Either<ErrorModel, void>> deleteRevenue(int id);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final ApiConsumer apiConsumer;

  RemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<Either<ErrorModel, List<RevenueModel>>> getRevenues() async {
    try {
      final response = await apiConsumer.get('expenses');
      if (response is List) {
        final revenues = response.map((e) => RevenueModel.fromJson(e)).toList();
        return Right(revenues);
      } else {
        return Left(ErrorModel(message: 'تنسيق الاستجابة غير صالح'));
      }
    } on ServerException catch (e) {
      return Left(ErrorModel(message: e.toString()));
    } on DioException catch (e) {
      return Left(
        ErrorModel(message: e.message ?? 'حدث خطأ في الاتصال بالخادم'),
      );
    } catch (e) {
      return Left(ErrorModel(message: 'حدث خطأ غير متوقع'));
    }
  }

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
  Future<Either<ErrorModel, void>> updateRevenue(RevenueModel revenue) {
    // TODO: implement updateRevenue
    throw UnimplementedError();
  }
}
