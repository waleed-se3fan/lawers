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

final class IssuesAddLoading extends IssuesState {}

final class IssuesAddSuccess extends IssuesState {
  final String message;
  IssuesAddSuccess(this.message);
}

final class IssuesAddFailure extends IssuesState {
  final String message;
  IssuesAddFailure(this.message);
}
