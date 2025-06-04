import 'package:equatable/equatable.dart';
import 'package:lawers/src/features/expenses/data/model/expense_model.dart';

abstract class RevenueState extends Equatable {
  const RevenueState();

  @override
  List<Object> get props => [];
}

class RevenueInitial extends RevenueState {}

class RevenueLoading extends RevenueState {}

class RevenueLoaded extends RevenueState {
  final List<RevenueModel> revenues;

  const RevenueLoaded(this.revenues);

  @override
  List<Object> get props => [revenues];
}

class RevenueError extends RevenueState {
  final String message;

  const RevenueError(this.message);

  @override
  List<Object> get props => [message];
}

class RevenueOperationSuccess extends RevenueState {
  final String message;

  const RevenueOperationSuccess(this.message);

  @override
  List<Object> get props => [message];
}
