import 'package:dartz/dartz.dart';
import 'package:lawers/core/errors/error_model.dart';
import 'package:lawers/src/features/issues/data/model/issues_model.dart';

abstract class IssuesRepository {
  Future<Either<ErrorModel, List<IssuesModel>>> getIssues();
}
