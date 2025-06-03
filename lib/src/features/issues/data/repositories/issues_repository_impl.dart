import 'package:dartz/dartz.dart';
import 'package:lawers/core/errors/error_model.dart';
import 'package:lawers/src/features/issues/data/data_source/remote_data_source.dart';
import 'package:lawers/src/features/issues/data/model/issues_model.dart';
import 'package:lawers/src/features/issues/domain/repositories/issues.dart';

class IssuesRepositoryImpl implements IssuesRepository {
  final IssuesRemoteDataSource remoteDataSource;
  IssuesRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<ErrorModel, List<IssuesModel>>> getIssues() async {
    try {
      var response = await remoteDataSource.getIssues();
      return Right(response);
    } catch (e) {
      return Left(ErrorModel(message: e.toString()));
    }
  }

  @override
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
  }) async {
    try {
      var response = await remoteDataSource.addIssue(
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
      return Right(response);
    } catch (e) {
      return Left(ErrorModel(message: e.toString()));
    }
  }
}
