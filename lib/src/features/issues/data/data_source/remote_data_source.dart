import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:lawers/core/data/api/dio_consumer.dart';
import 'package:lawers/core/errors/error_model.dart';
import 'package:lawers/src/features/issues/data/model/issues_model.dart';

abstract class IssuesRemoteDataSource {
  Future<List<IssuesModel>> getIssues();
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

class IssuesRemoteDataSourceImpl implements IssuesRemoteDataSource {
  var dio = DioConsumer(dio: Dio());

  @override
  Future<List<IssuesModel>> getIssues() async {
    try {
      var response = await dio.get('issue');
      List data = response;
      List<IssuesModel> issues =
          data.map((e) => IssuesModel.fromJson(e)).toList();
      return issues;
    } on DioException catch (e) {
      return e.response?.data;
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
      var response = await dio.post(
        'issue/store',
        data: {
          'caseNumber': caseNumber,
          'caseTitle': caseTitle,
          'caseType': caseType,
          'courtName': courtName,
          'circle': circle,
          'opponentName': opponentName,
          'opponentType': opponentType,
          'opponentPhone': opponentPhone,
          'opponentAddress': opponentAddress,
          'opponentNation': opponentNation,
          'opponentLawyerName': opponentLawyerName,
          'opponentLawyerPhone': opponentLawyerPhone,
          'judgeName': judgeName,
          'attorneyNumber': attorneyNumber,
          'contractPrice': contractPrice,
          'notes': notes,
        },
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(ErrorModel(message: e.response?.data['message']));
    }
  }
}
