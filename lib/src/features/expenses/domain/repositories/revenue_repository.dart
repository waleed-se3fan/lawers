import 'package:dartz/dartz.dart';
import 'package:lawers/core/errors/error_model.dart';
import 'package:lawers/src/features/expenses/data/model/expense_model.dart';

abstract class ExpenseRepository {
  Future<Either<ErrorModel, List<ExpenseModel>>> getExpenses();
  Future<Either<ErrorModel, void>> addExpense(ExpenseModel expense);
  Future<Either<ErrorModel, void>> updateExpense(ExpenseModel expense);
  Future<Either<ErrorModel, void>> deleteExpense(int id);
}
