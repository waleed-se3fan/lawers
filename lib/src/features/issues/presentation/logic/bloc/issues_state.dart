part of 'issues_bloc.dart';

@immutable
sealed class IssuesState {}

final class IssuesInitial extends IssuesState {}

final class IssuesLoading extends IssuesState {}

final class IssuesSuccess extends IssuesState {
  final List<IssuesModel> issues;
  IssuesSuccess(this.issues);
}

final class IssuesFailure extends IssuesState {
  final String message;
  IssuesFailure(this.message);
}
