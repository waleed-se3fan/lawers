import 'package:get_it/get_it.dart';
import 'package:lawers/core/app_cubit/app_cubit.dart';
import 'package:lawers/core/data/api/api_consumer.dart';
import 'package:lawers/core/data/api/dio_consumer.dart';
import 'package:lawers/core/data/cached/cache_helper.dart';

final GetIt getIt = GetIt.instance;
void setupLocator() {
  ///! FOR APP CUBIT ///

  getIt.registerFactory<AppCubit>(() => AppCubit());

  //!Api Services //

  ///! --DataSources-- ///

  /// !-- Repositories -- ///

  /// !-- UseCases -- ///

  // !Cubits //
}
