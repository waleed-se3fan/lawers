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
}
