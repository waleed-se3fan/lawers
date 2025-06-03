import 'package:dartz/dartz.dart';
import 'package:lawers/core/errors/error_model.dart';
import 'package:lawers/src/features/issues/data/model/issues_model.dart';
import 'package:lawers/src/features/issues/domain/repositories/issues.dart';

class GetIssueUsecase {
  final IssuesRepository repository;
  GetIssueUsecase(this.repository);

  Future<Either<ErrorModel, List<IssuesModel>>> call() async {
    return repository.getIssues();
  }
}
