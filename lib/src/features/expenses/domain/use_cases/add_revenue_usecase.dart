import 'package:dartz/dartz.dart';
import 'package:lawers/core/errors/error_model.dart';
import 'package:lawers/src/features/expenses/data/model/expense_model.dart';
import 'package:lawers/src/features/expenses/domain/repositories/revenue_repository.dart';

class AddRevenueUseCase {
  final ExpenseRepository repository;

  AddRevenueUseCase(this.repository);

  Future<Either<ErrorModel, void>> call(ExpenseModel expense) async {
    return await repository.addExpense(expense);
  }
}
