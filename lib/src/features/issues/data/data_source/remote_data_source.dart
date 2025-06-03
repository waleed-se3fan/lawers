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
          'customer_id': 1, // Using fixed customer_id as provided
          'opponent_name': opponentName,
          'opponent_type': opponentType,
          'opponent_phone': opponentPhone,
          'opponent_address': opponentAddress,
          'opponent_nation': opponentNation,
          'opponent_lawyer': opponentLawyerName,
          'lawyer_phone': opponentLawyerPhone,
          'court_name': courtName,
          'circle': circle,
          'case_number': caseNumber,
          'case_title': caseTitle,
          'attorney_number': attorneyNumber,
          'register_date': '2023-05-15', // Using fixed date as provided
          'judge_name': judgeName,
          'contract_price': double.tryParse(contractPrice) ?? 0.0,
          'notes': notes,
          'case_category_id': 1, // Using fixed category_id as provided
        },
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(ErrorModel(message: e.response?.data['message']));
    }
  }
}
