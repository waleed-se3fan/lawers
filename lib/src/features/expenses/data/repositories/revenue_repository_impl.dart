import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:lawers/core/data/api/dio_consumer.dart';
import 'package:lawers/core/errors/error_model.dart';
import 'package:lawers/core/errors/exceptions.dart';
import 'package:lawers/src/features/expenses/data/data_source/remote_data_source.dart';
import 'package:lawers/src/features/expenses/data/model/expense_model.dart';
import 'package:lawers/src/features/expenses/domain/repositories/revenue_repository.dart';

class ExpenseRepositoryImpl implements ExpenseRepository {
  final RemoteDataSource remoteDataSource;
  ExpenseRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<ErrorModel, void>> addExpense(ExpenseModel expense) {
    // TODO: implement addRevenue
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorModel, void>> deleteExpense(int id) {
    // TODO: implement deleteRevenue
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorModel, List<ExpenseModel>>> getExpenses() {
    return remoteDataSource.getExpenses();
  }

  @override
  Future<Either<ErrorModel, void>> updateExpense(ExpenseModel expense) {
    // TODO: implement updateExpense
    throw UnimplementedError();
  }
}
