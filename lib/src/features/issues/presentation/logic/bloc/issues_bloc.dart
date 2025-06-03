import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:lawers/src/features/issues/data/data_source/remote_data_source.dart';
import 'package:lawers/src/features/issues/data/model/issues_model.dart';
import 'package:lawers/src/features/issues/data/repositories/issues_repository_impl.dart';
import 'package:lawers/src/features/issues/domain/use_cases/get_issue_usecase.dart';
import 'package:meta/meta.dart';

part 'issues_event.dart';
part 'issues_state.dart';

class IssuesBloc extends Bloc<IssuesEvent, IssuesState> {
  IssuesBloc() : super(IssuesInitial()) {
    on<IssuesEvent>((event, emit) {});
    on<GetIssuesEvent>((event, emit) {
      getIssues();
    });
  }
  var usecase = GetIssueUsecase(
    IssuesRepositoryImpl(IssuesRemoteDataSourceImpl()),
  );
  Future getIssues() async {
    emit(IssuesLoading());
    try {
      final result = await usecase.call();
      result.fold(
        (l) => emit(IssuesFailure(l.message)),
        (r) => emit(IssuesSuccess(r)),
      );
    } on DioException catch (e) {
      emit(IssuesFailure(e.response?.data['message']));
    }
  }
}
