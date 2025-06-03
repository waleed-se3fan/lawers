import 'package:lawers/core/errors/error_model.dart';
import 'package:lawers/src/features/issues/domain/repositories/issues.dart';
import 'package:dartz/dartz.dart';

class AddNewIssueUsecase {
  final IssuesRepository repository;
  AddNewIssueUsecase(this.repository);
  Future<Either<ErrorModel, void>> call({
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
    return repository.addIssue(
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
  }
}
