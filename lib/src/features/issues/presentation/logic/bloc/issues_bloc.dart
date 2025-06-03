import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:lawers/src/features/issues/data/data_source/remote_data_source.dart';
import 'package:lawers/src/features/issues/data/model/issues_model.dart';
import 'package:lawers/src/features/issues/data/repositories/issues_repository_impl.dart';
import 'package:lawers/src/features/issues/domain/use_cases/add_new_issue_usecase.dart';
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
    on<AddNewIssueEvent>((event, emit) {
      addNewIssue(
        caseNumber: event.caseNumber,
        caseTitle: event.caseTitle,
        caseType: event.caseType,
        courtName: event.courtName,
        circle: event.circle,
        opponentName: event.opponentName,
        opponentType: event.opponentType,
        opponentPhone: event.opponentPhone,
        opponentAddress: event.opponentAddress,
        opponentNation: event.opponentNation,
        opponentLawyerName: event.opponentLawyerName,
        opponentLawyerPhone: event.opponentLawyerPhone,
        judgeName: event.judgeName,
        attorneyNumber: event.attorneyNumber,
        contractPrice: event.contractPrice,
        notes: event.notes,
      );
    });
  }

  Future getIssues() async {
    var usecase = GetIssueUsecase(
      IssuesRepositoryImpl(IssuesRemoteDataSourceImpl()),
    );
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

  Future addNewIssue({
    required String caseNumber,
    required String caseTitle,
    required String caseType,
    required String courtName,
    required String circle,
    required String opponentName,
    required String opponentType,
    required String opponentPhone,
    required String opponentAddress,
    required String opponentNation,
    required String opponentLawyerName,
    required String opponentLawyerPhone,
    required String judgeName,
    required String attorneyNumber,
    required String contractPrice,
    required String notes,
  }) async {
    var usecase = AddNewIssueUsecase(
      IssuesRepositoryImpl(IssuesRemoteDataSourceImpl()),
    );
    emit(IssuesAddLoading());
    try {
      final result = await usecase.call(
        caseNumber: caseNumber,
        caseTitle: caseTitle,
        caseType: caseType,
        courtName: courtName,
        circle: circle,
        opponentName: opponentName,
        opponentType: opponentType,
        opponentPhone: opponentPhone,
        opponentAddress: opponentAddress,
        opponentNation: opponentNation,
        opponentLawyerName: opponentLawyerName,
        opponentLawyerPhone: opponentLawyerPhone,
        judgeName: judgeName,
        attorneyNumber: attorneyNumber,
        contractPrice: contractPrice,
        notes: notes,
      );
      result.fold(
        (l) => emit(IssuesAddFailure(l.message)),
        (r) => emit(IssuesAddSuccess('')),
      );
    } on DioException catch (e) {
      emit(IssuesAddFailure(e.response?.data['message']));
    }
  }
}
