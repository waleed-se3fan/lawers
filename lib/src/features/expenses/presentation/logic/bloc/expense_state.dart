import 'package:equatable/equatable.dart';
import 'package:lawers/src/features/expenses/data/model/expense_model.dart';

abstract class ExpenseState extends Equatable {
  const ExpenseState();

  @override
  List<Object> get props => [];
}

class ExpenseInitial extends ExpenseState {}

class ExpenseLoading extends ExpenseState {}

class ExpenseLoaded extends ExpenseState {
  final List<ExpenseModel> expenses;

  const ExpenseLoaded(this.expenses);

  @override
  List<Object> get props => [expenses];
}

class ExpenseError extends ExpenseState {
  final String message;

  const ExpenseError(this.message);

  @override
  List<Object> get props => [message];
}

class ExpenseOperationSuccess extends ExpenseState {
  final String message;

  const ExpenseOperationSuccess(this.message);

  @override
  List<Object> get props => [message];
}
