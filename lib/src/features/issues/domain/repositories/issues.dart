import 'package:dartz/dartz.dart';
import 'package:lawers/core/errors/error_model.dart';
import 'package:lawers/src/features/issues/data/model/issues_model.dart';

abstract class IssuesRepository {
  Future<Either<ErrorModel, List<IssuesModel>>> getIssues();
  Future<Either<ErrorModel, void>> addIssue({
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
  });
}
