import 'package:equatable/equatable.dart';
import 'package:lawers/src/features/revenues/data/model/revenue_model.dart';

abstract class RevenueEvent extends Equatable {
  const RevenueEvent();

  @override
  List<Object> get props => [];
}

class LoadRevenuesEvent extends RevenueEvent {}

class AddRevenueEvent extends RevenueEvent {
  final RevenueModel revenue;

  const AddRevenueEvent(this.revenue);

  @override
  List<Object> get props => [revenue];
}

class UpdateRevenueEvent extends RevenueEvent {
  final RevenueModel revenue;

  const UpdateRevenueEvent(this.revenue);

  @override
  List<Object> get props => [revenue];
}

class DeleteRevenueEvent extends RevenueEvent {
  final int id;

  const DeleteRevenueEvent(this.id);

  @override
  List<Object> get props => [id];
}
