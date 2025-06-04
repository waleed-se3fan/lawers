import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:lawers/core/data/api/dio_consumer.dart';
import 'package:lawers/src/features/revenues/data/data_source/remote_data_source.dart';
import 'package:lawers/src/features/revenues/data/repositories/revenue_repository_impl.dart';
import 'package:lawers/src/features/revenues/domain/use_cases/add_revenue_usecase.dart';
import 'package:lawers/src/features/revenues/domain/use_cases/delete_revenue_usecase.dart';
import 'package:lawers/src/features/revenues/domain/use_cases/get_revenues_usecase.dart';
import 'package:lawers/src/features/revenues/presentation/logic/bloc/revenue_event.dart';
import 'package:lawers/src/features/revenues/presentation/logic/bloc/revenue_state.dart';

class RevenueBloc extends Bloc<RevenueEvent, RevenueState> {
  RevenueBloc() : super(RevenueInitial()) {
    on<LoadRevenuesEvent>(_onLoadRevenues);
    // on<AddRevenueEvent>(_onAddRevenue);
    // on<DeleteRevenueEvent>(_onDeleteRevenue);
  }

  FutureOr<void> _onLoadRevenues(
    LoadRevenuesEvent event,
    Emitter<RevenueState> emit,
  ) async {
    final getRevenuesUseCase = GetRevenuesUseCase(
      RevenueRepositoryImpl(
        remoteDataSource: RemoteDataSourceImpl(
          apiConsumer: DioConsumer(dio: Dio()),
        ),
      ),
    );
    emit(RevenueLoading());
    final result = await getRevenuesUseCase();
    result.fold(
      (error) => emit(RevenueError(error.message)),
      (revenues) => emit(RevenueLoaded(revenues)),
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
