import 'package:dio/dio.dart';
import 'package:lawers/core/data/api/dio_consumer.dart';
import 'package:lawers/src/features/issues/data/model/issues_model.dart';

abstract class IssuesRemoteDataSource {
  Future<List<IssuesModel>> getIssues();
}

class IssuesRemoteDataSourceImpl implements IssuesRemoteDataSource {
  @override
  Future<List<IssuesModel>> getIssues() async {
    var dio = DioConsumer(dio: Dio());
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
}
