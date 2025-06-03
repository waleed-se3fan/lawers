import 'package:dio/dio.dart';
import 'package:lawers/core/data/api/dio_consumer.dart';

abstract class IssuesRemoteDataSource {
  Future getIssues();
}

class IssuesRemoteDataSourceImpl implements IssuesRemoteDataSource {
  @override
  Future getIssues() {
    var dio = DioConsumer(dio: Dio());
    try {
      var response = dio.get('/issues');
      return response;
    } on DioException catch (e) {
      return e.response?.data;
    }
  }
}
