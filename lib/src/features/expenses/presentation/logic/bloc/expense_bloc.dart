import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:lawers/core/data/api/dio_consumer.dart';
import 'package:lawers/src/features/expenses/data/data_source/remote_data_source.dart';
import 'package:lawers/src/features/expenses/data/repositories/revenue_repository_impl.dart';
import 'package:lawers/src/features/expenses/domain/use_cases/get_revenues_usecase.dart';
import 'package:lawers/src/features/expenses/presentation/logic/bloc/expense_event.dart';
import 'package:lawers/src/features/expenses/presentation/logic/bloc/expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  ExpenseBloc() : super(ExpenseInitial()) {
    on<LoadExpensesEvent>(_onLoadExpenses);
    // on<AddExpenseEvent>(_onAddExpense);
    // on<DeleteExpenseEvent>(_onDeleteExpense);
  }

  FutureOr<void> _onLoadExpenses(
    LoadExpensesEvent event,
    Emitter<ExpenseState> emit,
  ) async {
    final getExpensesUseCase = GetExpensesUseCase(
      ExpenseRepositoryImpl(
        remoteDataSource: RemoteDataSourceImpl(
          apiConsumer: DioConsumer(dio: Dio()),
        ),
      ),
    );
    emit(ExpenseLoading());
    final result = await getExpensesUseCase();
    result.fold(
      (error) => emit(ExpenseError(error.message)),
      (expenses) => emit(ExpenseLoaded(expenses)),
    );
  }

  // FutureOr<void> _onAddRevenue(
  //   AddRevenueEvent event,
  //   Emitter<RevenueState> emit,
  // ) async {
  //   emit(RevenueLoading());
  //   final result = await AddRevenueUseCase(
  //     RevenueRepositoryImpl(remoteDataSource: RemoteDataSourceImpl(dio: DioConsumer())),
  //   );
  //   result.fold((error) => emit(RevenueError(error.message)), (_) {
  //     emit(const RevenueOperationSuccess('تمت إضافة الإيراد بنجاح'));
  //     add(LoadRevenuesEvent());
  //   });
  // }

  // FutureOr<void> _onDeleteRevenue(
  //   DeleteRevenueEvent event,
  //   Emitter<RevenueState> emit,
  // ) async {
  //   emit(RevenueLoading());
  //   final result = await DeleteRevenueUseCase(
  //     RevenueRepositoryImpl(remoteDataSource: RemoteDataSourceImpl(dio: DioConsumer())),
  //   );
  //   result.fold((error) => emit(RevenueError(error.message)), (_) {
  //     emit(const RevenueOperationSuccess('تم حذف الإيراد بنجاح'));
  //     add(LoadRevenuesEvent());
  //   });
  // }
}
