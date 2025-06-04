import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:lawers/core/data/api/api_consumer.dart';
import 'package:lawers/core/data/api/dio_consumer.dart';
import 'package:lawers/core/errors/error_model.dart';
import 'package:lawers/core/errors/exceptions.dart';
import 'package:lawers/src/features/expenses/data/model/expense_model.dart';

abstract class RemoteDataSource {
  Future<Either<ErrorModel, List<ExpenseModel>>> getExpenses();
  Future<Either<ErrorModel, void>> addExpense(ExpenseModel expense);
  Future<Either<ErrorModel, void>> updateExpense(ExpenseModel expense);
  Future<Either<ErrorModel, void>> deleteExpense(int id);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final ApiConsumer apiConsumer;

  RemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<Either<ErrorModel, List<ExpenseModel>>> getExpenses() async {
    try {
      final response = await apiConsumer.get('expenses');
      if (response is List) {
        final expenses = response.map((e) => ExpenseModel.fromJson(e)).toList();
        return Right(expenses);
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
  Future<Either<ErrorModel, void>> addExpense(ExpenseModel expense) {
    // TODO: implement addExpense
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorModel, void>> deleteExpense(int id) {
    // TODO: implement deleteExpense
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorModel, void>> updateExpense(ExpenseModel expense) {
    // TODO: implement updateExpense
    throw UnimplementedError();
  }
}
