import 'package:dartz/dartz.dart';
import 'package:lawers/core/errors/error_model.dart';
import 'package:lawers/src/features/expenses/data/model/expense_model.dart';
import 'package:lawers/src/features/expenses/domain/repositories/revenue_repository.dart';

class GetExpensesUseCase {
  final ExpenseRepository repository;

  GetExpensesUseCase(this.repository);

  Future<Either<ErrorModel, List<ExpenseModel>>> call() async {
    return repository.getExpenses();
  }
}
